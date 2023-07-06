#!/bin/bash
cat utils.list | xargs apt-get -y install
cat xorg.list | xargs apt-get -y install
cat gui.list | xargs apt-get -y install
