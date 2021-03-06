#!/usr/bin/env ruby

require 'fileutils'

TAB_FILE_NAME = 'data/out/EUconst_en.tab.conv'
REGISTRY_DIR = 'corpus_registry'
DATA_DIR = 'corpus_data'
CORPUS_NAME = 'TEST'

# Remove old data files (necessary to avoid weird errors!)
FileUtils.rm("#{DATA_DIR}/#{CORPUS_NAME}/*", :force => true)

# Encode the corpus data
system("cwb-encode -xsB -f #{TAB_FILE_NAME} -d #{DATA_DIR}/#{CORPUS_NAME} -s -D " +
           "-P lemma -P pos -P type -P degr_dia -P tense_defin -P person_type2 -P number")

# Create indexes for CQP
system("cwb-make -r #{REGISTRY_DIR} -V #{CORPUS_NAME}")

puts "################################"
puts
puts("Now you can test the corpus from the command line with the following command\n" + 
    "(remember to set the HOME attribute in the registry file appropriately!):\n" +
     "cqp -e -r ./corpus_registry")
puts
puts "################################"
