#define CLICKABLE_BLOCKS 0

//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Delim?*/      /*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{1,             "",	"~/Scripts/technobar/crypto.sh",	    1800,	9},
	{1,             "",	"~/Scripts/technobar/weather.sh",	    1800,	8},
	{1,             "",	"~/Scripts/technobar/cpu.sh",	        1,	    7},
	{1,             "",	"~/Scripts/technobar/packages.sh",	    1800,	10},
	{1,             "",	"~/Scripts/technobar/mem.sh",	        1,	    6},
	{1,             "",	"~/Scripts/technobar/disk.sh",	        60,	    5},
	{1,             "",	"~/Scripts/technobar/batt.sh",	        5,	    4},
	{1,             "",	"~/Scripts/technobar/therm.sh",	        2,	    3},
	{1,             "",	"~/Scripts/technobar/bright.sh",	    0,	    2},
	{1,             "",	"~/Scripts/technobar/time.sh",	        10,	    1},
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char *delim = " | ";

// Sets padding to left and right of status output
static char *l_padding = " ";
static char *r_padding = "  ";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
