#!/usr/bin/env ruby

CWB_BINARY_PATH = "/usr/local/bin"
TAB_FILE_NAME = "files/EUconst_en.tab"
DATA_DIR = "cwb_dat"

system("#{CWB_BINARY_PATH}/cwb-encode -xsB -f #{TAB_FILE_NAME} -d #{DATA_DIR} -s -D -P lemma -P pos")

