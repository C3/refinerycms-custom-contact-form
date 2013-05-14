module Refinery
  module ContactFormFields
    class ContactFormFieldsController < ::ApplicationController

      layout 'refinery/pages'
      helper ContactFormFieldsHelper

      def index
        @contact_form_fields = ContactFormField.order('position ASC')

        if @page = ::Refinery::Page.where(:link_url => "/contact-us").first
          present(@page)
        else
          error_404
        end
      end

      def send_contact_email
        field_values = ContactFormField.form_field_params(params)
        if ContactFormField.valid_field_values?(field_values)
          ContactFormMailer.contact_form_inquiry(field_values).deliver
          redirect_to '/contact-us/thank-you-for-your-inquiry'
        else
          render :index
        end

      end

    end
  end
end
