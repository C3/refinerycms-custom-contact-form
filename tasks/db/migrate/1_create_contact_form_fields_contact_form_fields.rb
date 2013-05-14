class CreateContactFormFieldsContactFormFields < ActiveRecord::Migration

  def up
    create_table :refinery_contact_form_fields do |t|
      t.string :field_name
      t.boolean :required
      t.string :field_type
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-contact_form_fields"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/contact_form_fields/contact_form_fields"})
    end

    drop_table :refinery_contact_form_fields

  end

end
