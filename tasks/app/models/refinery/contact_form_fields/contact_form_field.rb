module Refinery
  module ContactFormFields
    class ContactFormField < Refinery::Core::BaseModel
      self.table_name = 'refinery_contact_form_fields'

      TYPE_OPTIONS = {'single-line' => 'Single Line Text',
                      'multi-line'  => 'Multi-line Text',
                      'phone'       => 'Phone Number',
                      'email'       => 'Email Address'}

      attr_accessible :field_name, :required, :field_type, :position, :dom_id

      default_scope order('position ASC')

      acts_as_indexed :fields => [:field_name, :field_type]

      validates :field_name, :presence => true, :uniqueness => true
      validates_inclusion_of :field_type, :in => TYPE_OPTIONS
      before_create :dom_id

      def dom_id
        self.dom_id = field_name.downcase.gsub(' ', '-')
      end

      def self.form_field_params(params)
        params.reject do |k, v|
          ['authenticity_token', 'controller', 'submit', 'locale', 'action', 'utf8'].include? k
        end
      end

      def self.valid_field_values?(field_values)
        valid = true

        field_values.each do |field, value|
          field_type = ContactFormField.find_by_dom_id(field).field_type
          case field_type
          when 'email'
            valid = false unless (value =~ /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/) == 0
          when 'phone'
            valid = false unless (value =~ /\A[+?]+[0-9 ]*\z/) == 0
          end

          valid = false if ContactFormField.find_by_dom_id(field).required & value.empty?
        end

        valid
      end
    end
  end
end
