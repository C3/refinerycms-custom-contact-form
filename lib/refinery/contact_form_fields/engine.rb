module Refinery
  module ContactFormFields
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ContactFormFields

      engine_name :refinery_contact_form_fields

      initializer "register refinerycms_contact_form_fields plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "contact_form_fields"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.contact_form_fields_admin_contact_form_fields_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/contact_form_fields/contact_form_field',
            :title => 'field_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ContactFormFields)
      end
    end
  end
end
