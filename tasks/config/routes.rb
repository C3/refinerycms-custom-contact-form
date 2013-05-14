Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :contact_form_fields, :path=> '' do
    match "/contact-us" => 'contact_form_fields#index'
    match "/contact-us/send" => 'contact_form_fields#send_contact_email', :via => :post
  end

  # Admin routes
  namespace :contact_form_fields, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :contact_form_fields, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
