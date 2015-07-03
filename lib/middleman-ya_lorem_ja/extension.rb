# -*- coding: utf-8 -*-
# https://github.com/middleman/middleman/blob/v3-stable/middleman-core/lib/middleman-more/extensions/lorem.rb
# Extension namespace
module Middleman
  module YaLoremJa
    class Extension < ::Middleman::Extension
      option :my_option, 'default', 'An example option'

      def initialize(app, options_hash={}, &block)
        # Call super to build options from the options_hash
        super

        # Require libraries only when activated
        # require 'necessary/library'

        # set up your extension
        # puts options.my_option
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

      helpers do
        # Access to the Lorem object
        # @return [Middleman::Extensions::Lorem::LoremObject]
        def lorem_ja
          YaLoremObjectJa
        end
      end

      module YaLoremObjectJa
        class << self

          WORD_LEN_RANGE = 2..6
          WORD_COUNT_RANGE = 6..20

          
          # Get one placeholder word
          # @return [String]
          def word
            words(1)
          end

          # Get some number of placeholder words
          # @param [Fixnum] total
          # @return [String]
          def words(total)
            target_len = total.times.inject(0){ |sum| sum + rand(WORD_LEN_RANGE) }
            result = Dictionary::SENTENCES.keys.sort.bsearch{ |len| len >= target_len }
            unless result
              result = Dictionary::SENTENCES.keys.max
            end

            wk_word = randm(Dictionary::SENTENCES[result])
            
            return wk_word.sub(/[#{ Dictionary::SENTENCE_END_CHARS.join() }]$/, "")
          end

          # Get one placeholder sentence
          # @return [String]
          def sentence
            sentences(rand(WORD_COUNT_RANGE))
          end

          # Get some number of placeholder sentences
          # @param [Fixnum] total
          # @return [String]
          def sentences(total)
            
            target_len = total.times.inject(0){ |sum| sum + rand(WORD_LEN_RANGE)  }
            
            result = Dictionary::SENTENCES.keys.sort.bsearch{ |len| len >= target_len }
            unless result
              result = Dictionary::SENTENCES.keys.max
            end
            
            return randm(Dictionary::SENTENCES[result])
          end

          # Get one placeholder paragraph
          # @return [String]
          def paragraph
            paragraphs(1)
          end

          # Get some number of placeholder paragraphs
          # @param [Fixnum] total
          # @return [String]
          def paragraphs(total)
            (1..total).map do
              sentence
            end.join("\n\n")
          end

          def randm(range)
            a = range.to_a
            a[rand(a.length)]
          end

          def date(fmt='%Y年%m月%d日')
            y = rand(20) + 1990
            m = rand(12) + 1
            d = rand(31) + 1
            Time.local(y, m, d).strftime(fmt)
          end

          
          # Get a placeholder image, using placehold.it by default
          # @param [String] size
          # @param [Hash] options
          # @return [String]
          def image(size, options={})
            domain           = options[:domain] || 'http://placehold.it'
            src              = "#{domain}/#{size}"
            hex              = %w(a b c d e f 0 1 2 3 4 5 6 7 8 9)
            background_color = options[:background_color]
            color            = options[:color]

            if options[:random_color]
              background_color = hex.shuffle[0...6].join
              color = hex.shuffle[0...6].join
            end

            src << "/#{background_color.sub(/^#/, '')}" if background_color
            src << '/ccc' if background_color.nil? && color
            src << "/#{color.sub(/^#/, '')}" if color
            src << "&text=#{Rack::Utils.escape(options[:text])}" if options[:text]

            src
          end          
          
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
::Middleman::YaLoremJa::Extension.register(:ya_lorem_ja) 
