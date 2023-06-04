#!/bin/bash

# Copyright notice
COPYRIGHT="
#######################################################
# Author Your name
# Copyright (c) 2023 Yoir company
# All rights reserved.
#######################################################
"

# Path to the file
FILE="Path-your-file"

# Append the copyright notice at the beginning of the file
echo "$COPYRIGHT" | cat - "$FILE" > temp && mv temp "$FILE"

# Alternatively, append the copyright notice at the end of the file
echo "$COPYRIGHT" >> "$FILE"
