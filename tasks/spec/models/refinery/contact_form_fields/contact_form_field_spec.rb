require 'spec_helper'

module Refinery
  module ContactFormFields
    describe ContactFormField do

      describe "valid field values" do

        before :each do
          Refinery::ContactFormFields::ContactFormField.create!(:field_name => 'Contact Email',
                                                                :required   => true,
                                                                :field_type => 'email')
          Refinery::ContactFormFields::ContactFormField.create!(:field_name => 'Contact Phone Number',
                                                                :required   => false,
                                                                :field_type => 'phone')
          Refinery::ContactFormFields::ContactFormField.create!(:field_name => 'Message',
                                                                :required   => true,
                                                                :field_type => 'single-line')
        end

        it "should return true when a valid values have been entered in the form" do
          params = {'contact-email' => 'test@c3businesssolutions.com',
                    'contact-phone-number' => '+6 2345 5667'}

          Refinery::ContactFormFields::ContactFormField.valid_field_values?(params).should == true
        end

        it "should return false when an invalid email has been entered in the form" do
          params = {'contact-email' => 'testc3businesssolutions.com',
                    'contact-phone-number' => '+6 2345 5667'}

          Refinery::ContactFormFields::ContactFormField.valid_field_values?(params).should == false
        end

        it "should return false when an invalid phone number has been entered in the form" do
          params = {'contact-email' => 'test@c3businesssolutions.com',
                    'contact-phone-number' => '+6 pop2345 5667'}

          Refinery::ContactFormFields::ContactFormField.valid_field_values?(params).should == false
        end

        it "should return false when a required field is empty" do
          params = {'contact-email' => '',
                    'contact-phone-number' => '+6 2345 5667'}

          Refinery::ContactFormFields::ContactFormField.valid_field_values?(params).should == false
        end

      end
    end
  end
end
