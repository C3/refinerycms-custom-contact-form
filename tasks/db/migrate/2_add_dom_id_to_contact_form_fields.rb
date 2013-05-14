class AddDomIdToContactFormFields < ActiveRecord::Migration

  def change
    add_column :refinery_contact_form_fields, :dom_id, :string
  end

end
