#!/bin/sh

# Exit if any command fails
set -o errexit

echo Parsing XML files...
./bin/parse_xml.rb

echo CWB encoding...
./bin/cwb_encode.rb

echo Converting tags
./bin/convert_tags.rb conv_tables/penn.txt files/EUconst_en.tab > files/EUconst_en.tab.conv

echo Done

