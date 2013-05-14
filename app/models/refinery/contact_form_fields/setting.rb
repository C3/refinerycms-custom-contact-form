module Refinery
  module ContactFormFields
    class Setting

      class << self
        def contact_form_recipients
          Refinery::Setting.find_or_set(:contact_form_recipients,
            Refinery::Setting.find_or_set(:contact_form_recipients, (Refinery::Role[:refinery].users.first.email rescue nil))
          )
        end

        def contact_form_from_address
          Refinery::Setting.find_or_set(:contact_form_from_address, 'no-reply@domain.com')
        end

        def contact_form_reply_to_address
          Refinery::Setting.find_or_set(:contact_form_reply_to_address, 'no-reply@domain.com')
        end
      end

    end
  end
end
