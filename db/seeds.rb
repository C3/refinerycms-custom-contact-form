(Refinery.i18n_enabled? ? Refinery::I18n.frontend_locales : [:en]).each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-contact_form_fields').blank?
        user.plugins.create(:name => 'refinerycms-contact_form_fields',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/contact-us"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Contact Us',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end

  thanks_url = "/contact-us/thank-you-for-your-inquiry"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => thanks_url).empty?
    page = Refinery::Page.create(
      :title => 'Thank you for your inquiry',
      :link_url => thanks_url,
      :deletable => false,
      :show_in_menu => false,
      :menu_match => "^#{thanks_url}(\/|\/.+?|)$"
    )
    page.update_attribute(:parent, Refinery::Page.where(:link_url => url).first)
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end

  Refinery::Setting.find_or_set(:contact_form_recipients,
    Refinery::Setting.find_or_set(:contact_form_recipients, (Refinery::Role[:refinery].users.first.email rescue nil))
  )

  Refinery::Setting.find_or_set(:contact_form_from_address, 'no-reply@domain.com')

  Refinery::Setting.find_or_set(:contact_form_from_address, 'no-reply@domain.com')
end
