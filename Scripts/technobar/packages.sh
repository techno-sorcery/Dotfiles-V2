#!/bin/bash

# Mem
upgradable="$(apt list --upgradable 2>/dev/null | wc -l)"
total="$(apt list --installed 2>/dev/null | wc -l)"
icon1="📦"

# Output
echo $icon1 $(($total - 1)), ⬆️ $(($upgradable - 1))
# echo $icon1 $(($upgradable - 1))
