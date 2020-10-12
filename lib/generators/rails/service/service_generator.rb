require 'rails/generators'
require 'rails/generators/generated_attribute'

module Rails
  module Generators
    class ServiceGenerator < NamedBase
      source_root File.expand_path('templates', __dir__)

      argument :methods, type: :array, default: [], banner: 'method method'
      class_option :module, type: :string

      def generate_service_class
        template 'service.rb.erb', File.join('app/services', class_path,
                                             "#{file_name}.rb")
      end

      def module_name
        @module_name = options[:module]
      end
    end
  end
end
