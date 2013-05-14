module Refinery
  module ContactFormFields
    class ContactFormMailer < ActionMailer::Base

      def contact_form_inquiry(inquiry)
        @inquiry_details = inquiry.reject{|k, v| v.empty?}

        mail :subject   => "Contact form inquiry",
             :to        => Setting.contact_form_recipients,
             :from      => Setting.contact_form_from_address,
             :reply_to  => Setting.contact_form_reply_to_address
      end

    end
  end
end
