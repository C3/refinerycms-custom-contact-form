module Refinery
  module ContactFormFields
    module Admin
      class ContactFormFieldsController < ::Refinery::AdminController

        crudify :'refinery/contact_form_fields/contact_form_field',
                :title_attribute => 'field_name', :xhr_paging => true

      end
    end
  end
end
