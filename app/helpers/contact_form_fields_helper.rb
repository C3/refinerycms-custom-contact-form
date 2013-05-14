module ContactFormFieldsHelper

  def field_input_tag(field)
    options = {}
    options[:required] = 'required' if field.required?

    case field.field_type
    when 'multi-line'
      options[:rows] = 10
      options[:cols] = 30
      input_tag = text_area_tag(field.dom_id, nil, options)
    when 'email'
      options[:maxlength] = 255
      input_tag = email_field_tag(field.dom_id, nil, options)
    else
      options[:maxlength] = 255
      input_tag = text_field_tag(field.dom_id, nil, options)
    end

    input_tag
  end

end
