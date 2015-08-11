# -*- coding: utf-8 -*-
require 'ya_lorem_ja'
require 'thread'

# -*- coding: utf-8 -*-
# https://github.com/middleman/middleman/blob/v3-stable/middleman-core/lib/middleman-more/extensions/lorem.rb
# Extension namespace
module Middleman
  module YaLoremJa
    class Extension < ::Middleman::Extension

      EXTENSION_NAME = :ya_lorem_ja
      option :resource_name, ::YaLoremJa::Lorem::DEFAULT_RESOURCE_NAME, 'resource name'
      option :char_count_range, ::YaLoremJa::Lorem::DEFAULT_CHAR_COUNT_RANGE_IN_WORD, 'character count range in a word'
      option :word_count_range, ::YaLoremJa::Lorem::DEFAULT_WORD_COUNT_RANGE_IN_SENTENCE, 'word count range in a sentence'
      option :sentence_count_range, ::YaLoremJa::Lorem::DEFAULT_SENTENCE_COUNT_RANGE_IN_PARAGRAPH, 'sentence count range in a paragraph'

      def initialize(app, options_hash={}, &block)
        # Call super to build options from the options_hash
        super

        # Require libraries only when activated
        # require 'necessary/library'

        # set up your extension
        # puts options.my_option
        app.set EXTENSION_NAME, options
      end

      def after_configuration
        # Do something
      end

      # A Sitemap Manipulator
      # def manipulate_resource_list(resources)
      # end

      # module do
      #   def a_helper
      #   end
      # end

      class YaLoremJaObj < ::YaLoremJa::Lorem
        @@singleton__instance__ = nil
        @@singleton__mutex__ = Mutex.new
        def self.instance(resource_name=DEFAULT_RESOURCE_NAME, char_count_range=DEFAULT_CHAR_COUNT_RANGE_IN_WORD, word_count_range=DEFAULT_WORD_COUNT_RANGE_IN_SENTENCE, sentence_count_range=DEFAULT_SENTENCE_COUNT_RANGE_IN_PARAGRAPH)
          return @@singleton__instance__ if @@singleton__instance__
          @@singleton__mutex__.synchronize {
            return @@singleton__instance__ if @@singleton__instance__           
            @@singleton__instance__ = new(resource_name, char_count_range, word_count_range, sentence_count_range)
          }
          @@singleton__instance__
        end

        def self.reset_instance
          @@singleton__mutex__.synchronize {
            @@singleton__instance__  = nil if @@singleton__instance__           
          }
        end

        def paragraph
          self.paragraphs(1)
        end

        def paragraphs(total, opts={  })
          default_options = { start_sep: "<p>", end_sep: "</p>" }
          merged_opts = default_options.merge(opts)
          super(total, merged_opts)
        end
        
        private
        def initialize(resource_name, char_count_range, word_count_range, sentence_count_range)
          super(resource_name, char_count_range, word_count_range, sentence_count_range)
        end
        private_class_method :new
      end

      helpers do
        def lorem_ja
          ext_settings = config[::Middleman::YaLoremJa::Extension::EXTENSION_NAME]
          return YaLoremJaObj.instance(ext_settings.resource_name,
                                       ext_settings.char_count_range,
                                       ext_settings.word_count_range,
                                       ext_settings.sentence_count_range)
        end
      end
    end
  end
end
# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

# MyExtension.register(:my_extension)
::Middleman::YaLoremJa::Extension.register(::Middleman::YaLoremJa::Extension::EXTENSION_NAME) 
