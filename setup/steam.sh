#!/bin/bash
dpkg --add-architecture i386 
apt update
apt -y install libgl1-mesa-glx:i386 libc6:amd64 libc6:i386 libegl1:amd64 libegl1:i386 libgbm1:amd64 libgbm1:i386 libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 libgl1:amd64 libgl1:i386 nvidia-driver-libs:i386 steam-libs-amd64:amd64 steam-libs-i386:i386
