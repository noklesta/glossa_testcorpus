#!/usr/bin/env ruby

# Extracts attributes from XML coded text and outputs them in a tab-separated format.

require 'rubygems'
require 'nokogiri'

XML_DIR = 'EUconst_xml_en'
OUTPUT_FILE = 'data/out/EUconst_en.tab'

File.open(OUTPUT_FILE, 'w') do |outfile|
  Dir["#{XML_DIR}/*.xml"].each do |infilename|
    doc = Nokogiri::XML(open(infilename))
    doc.css('w').each do |word|

      # Compounds have no lemma attribute; assume that it is identical to the word form.
      word['lem'] ||= word.inner_text 

      unless word.inner_text && word['lem'] && word['pos']
        $stderr.puts "Missing attributes from #{word}" 
        next
      end

      outfile.puts "#{word.inner_text}\t#{word['lem']}\t#{word['pos']}"
    end
  end
end
