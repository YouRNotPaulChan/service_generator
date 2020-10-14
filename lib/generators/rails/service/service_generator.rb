require 'rails/generators'
require 'rails/generators/generated_attribute'
require 'byebug'

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

      def class_name
        @class_name = file_name.classify
      end

      def class_body
        if @module_name.present?
          class_str.each_line.sum { |line| line.blank? ? line : "  #{line}" }
        else
          class_str
        end
      end

      def class_str
        <<~RUBY
          class #{class_name} < ApplicationService
            def initialize(attributes)
              @attributes = attributes
            end

            def call
              # some code
            end
            #{methods_body}
          end
        RUBY
      end

      def methods_body
        return if methods.blank?

        methods_str = methods.map do |method|
          <<~RUBY
            def #{method}
              # some code
            end
          RUBY
        end.join("\n")

        private_str = <<~RUBY

          private

        RUBY
        str = private_str + methods_str
        str.each_line.sum { |line| line.blank? ? line : "  #{line}" }
      end
    end
  end
end
