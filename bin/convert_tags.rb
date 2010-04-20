#!/usr/bin/env ruby

# Convert the original part-of-speech tags into CWB attributes

####################
# Top-level methods
####################

def fill_conversion_table_from(conversion_table_file)
  conversion_table = {}
  
  File.foreach(conversion_table_file) do |line|
    line =~ /^(\S+)(.+)/
      conversion_table[$1] = $2
  end
  conversion_table
end

def convert_tags(tab_file, conversion_table)
  File.foreach(tab_file) do |line|
    raise "Error in line #{$.}: #{line}" unless line.strip =~ /^(.+)\t(.+)$/
    puts $1 + conversion_table[$2]
  end
end

###############
# Main program
###############

raise "Usage: #{$0} CONVERSION_TABLE TAB_FILE" unless ARGV.size == 2

conversion_table_file = ARGV[0]
tab_file = ARGV[1]

conversion_table = fill_conversion_table_from(conversion_table_file)
convert_tags(tab_file, conversion_table)

