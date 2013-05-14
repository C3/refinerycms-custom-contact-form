# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "ContactFormFields" do
    describe "Admin" do
      describe "contact_form_fields" do
        login_refinery_user

        describe "contact_form_fields list" do
          before do
            FactoryGirl.create(:contact_form_field, :field_name => "UniqueTitleOne")
            FactoryGirl.create(:contact_form_field, :field_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.contact_form_fields_admin_contact_form_fields_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.contact_form_fields_admin_contact_form_fields_path

            click_link "Add New Contact Form Field"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Field Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::ContactFormFields::ContactFormField.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Field Name can't be blank")
              Refinery::ContactFormFields::ContactFormField.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:contact_form_field, :field_name => "UniqueTitle") }

            it "should fail" do
              visit refinery.contact_form_fields_admin_contact_form_fields_path

              click_link "Add New Contact Form Field"

              fill_in "Field Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::ContactFormFields::ContactFormField.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:contact_form_field, :field_name => "A field_name") }

          it "should succeed" do
            visit refinery.contact_form_fields_admin_contact_form_fields_path

            within ".actions" do
              click_link "Edit this contact form field"
            end

            fill_in "Field Name", :with => "A different field_name"
            click_button "Save"

            page.should have_content("'A different field_name' was successfully updated.")
            page.should have_no_content("A field_name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:contact_form_field, :field_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.contact_form_fields_admin_contact_form_fields_path

            click_link "Remove this contact form field forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::ContactFormFields::ContactFormField.count.should == 0
          end
        end

      end
    end
  end
end
