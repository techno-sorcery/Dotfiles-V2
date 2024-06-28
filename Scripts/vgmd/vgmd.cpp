#include <iostream>
#include <string>
#include <cstring>
#include <regex>

#include <unistd.h>
#include <sys/wait.h>


// Global vars
bool mp3 = false;
bool verbose = false;


// Parse individual line for links
std::string parse_line(std::string line, std::regex my_regex) {
    std::smatch link_match;
    
    // Regex extract url
    if (std::regex_search(line, link_match, my_regex)) {
        std::regex_search(line, link_match, my_regex);

        // Throw error if invalid format
        if (link_match.size() != 2) {
            std::cout << "Invalid website format!\n";
            exit(EXIT_FAILURE);
        }

        return link_match[1];
    }
    
    return "";
}


// Download file
void download(std::string link) {

    // Fork
    pid_t child_pid = fork();

    // Error
    if (child_pid == -1) {
        perror("fork() failed");
        exit(EXIT_FAILURE);

    // Child
    } else if (child_pid == 0) {
        if (verbose) execlp("wget", "wget", link.c_str(), NULL);
        else execlp("wget", "wget", "-q", link.c_str(), NULL);
    }

}


// Parse download page
void parse_download(std::string link) {
    static std::regex flac_regex("<p><a href=\"(.+)(?=\"><span class=\"songDownloadLink\">"
                                 "<i class=\"material-icons\">get_app<\\/i>Click here to download as FLAC)");
    static std::regex mp3_regex("<p><a href=\"(.+)(?=\"><span class=\"songDownloadLink\">"
                                "<i class=\"material-icons\">get_app<\\/i>Click here to download as MP3)");
    int pipe_fd[2];

    // Create pipe and fork
    pipe(pipe_fd);
    pid_t child_pid = fork();

    // Error
    if (child_pid == -1) {
        perror("fork() failed");
        exit(EXIT_FAILURE);

    // Child
    } else if (child_pid == 0) {

        // Close read end of pipe
        close(pipe_fd[0]);

        // Combine link and convert to array
        link = "https://downloads.khinsider.com" + link;

        // Redirect STDOUT_FILENO to pipe and curl
        dup2(pipe_fd[1], STDOUT_FILENO);

        if (verbose) execlp("curl", "curl", link.c_str(), NULL);
        else execlp("curl", "curl", "-s", link.c_str(), NULL);

    // Parent
    } else {
        std::string line = "";
        char buff;
        bool found = false;

        // Close write end of pipe and wait
        close(pipe_fd[1]);

        // Read from pipe
        while (read(pipe_fd[0], &buff, 1) > 0) {

            // build string
            if (buff != '\n') {
                line.push_back(buff);

            // newline
            } else {
                std::string parsed_link = "";
                /* std::cout << parsed_link << "\n"; */

                // Get link
                if (mp3) {
                    parsed_link = parse_line(line, mp3_regex);

                } else {
                    parsed_link = parse_line(line, flac_regex);
                }

                // Wget if link
                if (parsed_link != "") {
                    found = true;
                    download(parsed_link);
                }

                // clear string
                line = "";
            }

        }

        // Throw error if nothing found
        if (!found) {
            std::cout << "No valid download links found.\n";
            exit(EXIT_FAILURE);
        }
    }
}


// Parse song playlist from URL
void parse_playlist(char *link) {
    static std::regex link_regex("<td class=\"playlistDownloadSong\"><a href=\""
                                 "(.+)(?=\"><i class=\"material-icons\">get_app<\\/i><\\/a><\\/td>)");
    int pipe_fd[2];
    std::cout << link << "\n";

    // Create pipe and fork
    pipe(pipe_fd);
    pid_t child_pid = fork();

    // Error
    if (child_pid == -1) {
        perror("fork() failed");
        exit(EXIT_FAILURE);

    // Child
    } else if (child_pid == 0) {

        // Close read end of pipe
        close(pipe_fd[0]);

        // Redirect STDOUT_FILENO to pipe and curl
        dup2(pipe_fd[1], STDOUT_FILENO);
        if (verbose) execlp("curl", "curl", link, NULL);
        else execlp("curl", "curl", "-s", link, NULL);

    // Parent
    } else {
        std::string line = "";
        char buff;
        bool found = false;

        // Close write end of pipe and wait
        close(pipe_fd[1]);

        // Read from pipe
        while (read(pipe_fd[0], &buff, 1) > 0) {

            // build string
            if (buff != '\n') {
                line.push_back(buff);

            // newline
            } else {

                // get link
                std::string parsed_link = parse_line(line, link_regex);

                // curl if link
                if (parsed_link != "") {
                    found = true;

                    std::cout << parsed_link << '\n';
                    parse_download(parsed_link);
                }

                // clear string
                line = "";
            }
        }

        // Throw error if no songs found
        if (!found) {
            std::cout << "Invalid playlist link, couldn't find anything to download!\n";
            exit(EXIT_FAILURE);
        }
    }
}


int main(int argc, char *argv[]) {
    bool setpath = false;

    // Check if no args
    if (argc == 1) {
        std::cout << "Insufficient arguments, try 'vgmd --help' for more info\n";
        exit(EXIT_FAILURE);
    }
    
    // Parse args
    for (int i = 1; i < argc; i++) {
        bool valid_link = false;
        
        // Set path
        if (setpath) {
            setpath = false;

            // Check path
            if (chdir(argv[i]) == -1) {
                std::cout << "Invalid path, try 'vgmd --help' for more info\n";
                exit(EXIT_FAILURE);
            }

        // mp3 mode
        } else if (strcmp(argv[i], "-m") == 0 || strcmp(argv[i], "--mp3") == 0) {
            mp3 = true;
        
        // Path
        } else if (strcmp(argv[i], "-p") == 0 || strcmp(argv[i], "--path") == 0) {
            setpath = true;

        // Verbose
        } else if (strcmp(argv[i], "-v") == 0 ) { 
            verbose = true;

        // Help
        } else if (strcmp(argv[i], "-h") == 0 || strcmp(argv[i], "--help") == 0) {
            std::cout << "Usage: vgmd [options..] [urls...]" << '\n';
            std::cout << '\t' << "-m, --mp3" << "\t\t\t\t" << "Downloads mp3s instead of flacs" << '\n';
            std::cout << '\t' << "-p, --path <path>" << "\t\t" << "Set path at which to save files" << '\n';
            std::cout << '\t' << "-v" << "\t\t\t\t\t\t" << "Shows output from curl and wget" << '\n';
            std::cout << '\t' << "-h, --help" << "\t\t\t\t" << "Invoke this help message" << '\n';
            exit(EXIT_SUCCESS);

        // Parse link
        } else if (argv[i][0] != '-'){
            valid_link = true;
            parse_playlist(argv[i]);

        // Invalid option
        } else {
            std::cout << "Invalid option, try 'vgmd --help' for more info\n";
            exit(EXIT_FAILURE);
        }

        // Throw error if no url provided
        if (i == argc - 1 && !valid_link) {
            std::cout << "No link provided, try 'vgmd --help' for more info\n";
            exit(EXIT_FAILURE);
        }
    }

    while (wait(NULL) != -1) {};
}
