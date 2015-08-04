# -*- coding: utf-8 -*-
require 'ya_lorem_ja'
require 'singleton'

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

      class YaLoremJaObj < ::YaLoremJa::Lorem
        include Singleton
        
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

      helpers do
        def lorem_ja
          return YaLoremJaObj.instance
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
