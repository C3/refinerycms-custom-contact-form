require 'refinerycms-core'

module Refinery
  autoload :ContactFormFieldsGenerator, 'generators/refinery/contact_form_fields_generator'

  module ContactFormFields
    require 'refinery/contact_form_fields/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
