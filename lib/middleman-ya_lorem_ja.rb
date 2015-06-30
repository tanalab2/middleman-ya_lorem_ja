# -*- coding: utf-8 -*-
# Require core library
require 'middleman-core'
require "middleman-ya_lorem_ja/dictionary"
require "middleman-ya_lorem_ja/extension"
require "middleman-ya_lorem_ja/version"

module Middleman
  module YaLoremJa
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "word:", ::Middleman::YaLoremJa::Extension::YaLoremObjectJa.word
  puts "words(5):", ::Middleman::YaLoremJa::Extension::YaLoremObjectJa.words(5)
  puts "sentence:", ::Middleman::YaLoremJa::Extension::YaLoremObjectJa.sentence
  puts "sentences(3):", ::Middleman::YaLoremJa::Extension::YaLoremObjectJa.sentences(3)
  puts "paragraph:", ::Middleman::YaLoremJa::Extension::YaLoremObjectJa.paragraph
  puts "paragraph(5):", ::Middleman::YaLoremJa::Extension::YaLoremObjectJa.paragraphs(5)
end
