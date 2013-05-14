
FactoryGirl.define do
  factory :contact_form_field, :class => Refinery::ContactFormFields::ContactFormField do
    sequence(:field_name) { |n| "refinery#{n}" }
  end
end

