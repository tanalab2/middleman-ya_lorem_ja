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
