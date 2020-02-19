Rails.application.routes.draw do
 devise_for :taxpayer_accounts, controllers: { sessions: 'taxpayer_accounts/sessions', registrations: 'taxpayer_accounts/registrations', confirmations: 'taxpayer_accounts/confirmations' }

  # unauthenticated :user do
  #   root to: "home#index"
  # end
  # authenticated :user do
  #   root :to => 'gov_module/taxpayers#index'
  # end
 
  authenticated :user do
    root to: "gov_module/businesses#index"
  end
  resources :business_registries, only: [:create]
  resources :tricycle_registries, only: [:create]

  resources :for_taxpayers, only: [:index]
  resources :for_governments, only: [:index]


  resources :localities, only: [:index]
  resources :how_it_works, only: [:index]
  resources :home, only: [:index]
  # unauthenticated :user do
  #   root :to => 'home#index', :constraints => lambda { |request| request.env['warden'].user.nil? }, as: :unauthenticated_root
  # end
 

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :taxpayers do
    resources :business_registrations, only: [:new, :create], module: :taxpayers
    resources :business_locations, only: [:new], module: :taxpayers
    resources :businesses, only: [:index, :new, :create, :show], module: :taxpayers
  #   resources :real_properties, only: [:index], module: :taxpayers
  #   resources :lands,       only: [:new, :create], module: :taxpayers
  #   resources :buildings,   only: [:new, :create], module: :taxpayers
  #   resources :machineries, only: [:new, :create], module: :taxpayers
  end
  namespace :real_properties do
    resources :lands, only: [:index, :show]
  end
  resources :real_properties do
    resources :classifications, only: [:new, :create], module: :real_properties
    resources :sub_classifications, only: [:new, :create], module: :real_properties

    resources :property_revisions, only: [:new, :create], module: :real_properties
    resources :real_property_areas, only: [:new, :create], module: :real_properties
    resources :encumberances, only: [:index, :new, :create], module: :real_properties do
      resources :cancellations, only: [:new, :create], module: :encumberances
    end
    resources :settings,      only: [:index],        module: :real_properties
    resources :arp_requests,  only: [:new, :create], module: :real_properties
    resources :adjustments,   only: [:new, :create], module: :real_properties
  end
  resources :settings, only: [:index]
  namespace :configurations do
    resources :adjustment_factors, only: [:new, :create]
    resources :classifications, only: [:new, :create, :show] do
      resources :sub_classifications, only: [:new, :create], module: :classifications
    end
    resources :general_revisions, only: [:new, :create]
  end
  resources :businesses, only: [:index, :show] do

  end
  namespace :businesses_section do
    resources :dashboards, only: [:index]
    resources :settings, only: [:index]
    resources :documents, only: [:new, :create], module: :settings do
      resources :prerequisites, only: [:new, :create]
    end
    resources :line_of_business_categories, only: [:new, :create, :show], module: :settings do
      resources :line_of_businesses, only: [:new, :create, :edit, :update]
    end

    resources :business_tax_categories, only: [:new, :create, :show], module: :settings do
      resources :gross_sales_tax_ranges, only: [:new, :create]
    end
    resources :sanitary_inspection_configs, only: [:new, :create], module: :settings
  end
  resources :assessments, only: [:show] do
    resources :payments, only: [:new, :create], module: :assessments
  end
  resources :start_a_business, only: [:new, :create, :show]
  namespace :business_applications do
    resources :businesses
  end

  namespace :business_registration do
    resources :business_finances, only: [:create]
    resources :business_addresses, only: [:create]
    resources :application_types, only: [:create]
    resources :business_names, only: [:create]
    resources :ownership_types, only: [:create]
    resources :business_categories, only: [:create]
    resources :line_of_businesses, only: [:create]
    resources :locations, only: [:new, :create]
    resources :agreements, only: [:create]
    resources :summaries, only: [:index]
    resources :submissions, only: [:create]
    resources :business_activities, only: [:new, :create]
  end
  namespace :payment_channels do
    resources :pay_maya_payments do
      match "/checkout" => "pay_maya_payments#checkout",  via: [:post], on: :member
    end
  end

  resources :carts, only: [:destroy]

  namespace :gov_module do
    namespace :approved_permits do 
      resources :business_permits, only: [:index]
      resources :tricycle_permits, only: [:index]
    end
    resources :permits, shallow: true do
      resources :cancellations, only: [:create], module: :permits
    end
    resources :tricycle_organizations, only: [:index, :show] do
      resources :without_permits, only: [:index], module: :tricycle_organizations
      resources :with_permits, only: [:index], module: :tricycle_organizations
    end
    namespace :treasury do
      resources :cash_books, only: [:index, :show] do
        resources :receipt_line_items, only: [:new, :create], module: :cash_books
      end
    end
    resources :bplo_settings, only: [:index]
    namespace :bplo_settings do
      resources :tricycle_fees, only: [:index, :new, :create, :show]
      resources :competetive_index_categories, only: [:new, :create, :show, :edit, :update]
      resources :line_of_businesses, only: [:index, :show] do
        resources :charges, only: [:new, :create], module: :line_of_businesses
      end
      resources :surcharges, only: [:new, :create]
      resources :discounts, only: [:new, :create]
      resources :signatories, only: [:new, :create]
      resources :public_markets, only: [:new, :create]
      resources :charges, only: [:index, :new, :create, :edit, :update]
      resources :capital_tax_configs, only: [:new, :create]
      resources :business_tax_categories, only: [:index, :new, :create] 
    end
    namespace :permit_applications do
      resources :business_permit_applications do
        resources :additional_assessments, only: [:new, :create], module: :business_permit_applications
        resources :volumes, only: [:new, :create], module: :business_permit_applications
        resources :gross_sales, only: [:new, :create ,:destroy], module: :business_permit_applications
        resources :business_activities, only: [:new, :create, :destroy], module: :business_permit_applications
        resources :voucher_amounts, only: [:new, :create, :edit, :update, :destroy], module: :business_permit_applications
        resources :capitals, only: [:new, :create], module: :business_permit_applications
        resources :assessments, only: [:index, :show, :new, :create], module: :business_permit_applications
      end
      resources :tricycle_permit_applications do
        resources :penalty_amounts, only: [:new, :create], module: :tricycle_permit_applications
        resources :vouchers, only: [:show], module: :tricycle_permit_applications
        resources :voucher_amounts, only: [:new, :create, :edit, :update], module: :tricycle_permit_applications
        resources :charge_cancellations, only: [:destroy], module: :tricycle_permit_applications

        resources :assessments, only: [:new, :create], module: :tricycle_permit_applications
        resources :permit_issuances, only: [:new, :create], module: :tricycle_permit_applications
      end
    end

    resources :employees, only: [:show] do
      resources :cash_accounts, only: [:new, :create], module: :employees
    end
    resources :business_permits, only: [:show, :edit, :update] do
      resources :permit_signatories, only: [:new, :create, :destroy], module: :business_permits
    end

    resources :tricycle_permits, only: [:show, :edit, :update] do
      resources :permit_signatories, only: [:new, :create, :destroy], module: :tricycle_permits
    end

    resources :mode_of_payments, only: [:create], module: :businesses
    resources :voucher_amounts, only: [:new, :create, :destroy]
    resources :tricycles do
      resources :locations, only: [:edit, :update], module: :tricycles
      resources :assessments, only: [:new, :create], module: :tricycles
      resources :permits, only: [:index], module: :tricycles
      resources :settings, only: [:index], module: :tricycles
      resources :assessments, only: [:index], module: :tricycles
      # resources :permit_applications, only: [:new, :create, :show], module: :tricycles
    end

    resources :assessments, only: [:index]
    resources :vouchers, only: [:show, :destroy]
    namespace :reports do
      resources :barangays, only: [:show]
      resources :competetive_index_categories, only: [:show]
      resources :public_markets, only: [:show] do
        resources :regular_with_permits, only: [:index], module: :public_markets
        resources :regular_without_permits, only: [:index], module: :public_markets
        resources :transient_with_permits, only: [:index], module: :public_markets
        resources :transient_without_permits, only: [:index], module: :public_markets
      end
      resources :line_of_businesses, only: [:show]
      resources :registered_businesses, only: [:index], module: :reports
      resources :business_permits, only: [:index]
      resources :closed_businesses, only: [:index]

      resources :businesses_without_permits, only: [:index]
      resources :tricycle_with_permits, only: [:index]
      resources :tricycle_without_permits, only: [:index]
    end
    resources :agencies, only: [:show] do
      resources :reports, only: [:index], module: :agencies
    end
    resources :demo_request_processings, only: [:new, :create]
    resources :applications, only: [:index]
    namespace :settings do
      resources :agencies, only: [:new, :create]
    end
    resources :barangays, only: [:index, :show] do
      resources :businesses_without_permits, only: [:index], module: :barangays
      resources :businesses, only: [:index], module: :barangays
      resources :taxpayers, only: [:index], module: :barangays
      resources :collections, only: [:index], module: :barangays
      resources :reports, only: [:index], module: :barangays
      resources :business_permits, only: [:index], module: :barangays
    end

    resources :monitoring, only: [:index]
    resources :reports, only: [:index]
    resources :collections, only: [:index, :show]
    resources :businesses, only: [:new, :create, :destroy] do
      resources :voucher_amounts, only: [:edit, :update, :destroy], module: :businesses
    end
    resources :taxpayers do
      resources :tricycles, only: [:index, :new, :create], module: :taxpayers
      resources :businesses, only: [:index], module: :taxpayers
      resources :real_properties, only: [:index], module: :taxpayers
      resources :settings, only: [:index], module: :taxpayers

    end
    resources :required_documents, shallow: true do
      resources :attachments, only: [:new, :create], module: :required_documents
    end
    resources :business_permit_applications, only: [:show, :destroy] do
      resources :permit_issuances, only: [:new, :create], module: :business_permit_applications
      resources :charge_processings, only: [:create], module: :business_permit_applications
    end
    resources :businesses, only: [:index, :show, :edit, :update] do
      resources :establishments, only: [:new, :create], module: :businesses
      resources :closings,       only: [:new, :create], module: :businesses
      resources :locations, only: [:new, :create, :edit, :update], module: :businesses
      resources :business_tax_categories, only: [:edit, :update], module: :businesses
      resources :permits, only: [:index], module: :businesses
      resources :business_activities, only: [:edit, :update, :destroy], module: :businesses
      resources :business_activity_updates, only: [:new, :create], module: :businesses
      resources :ownership_types, only: [:edit, :update], module: :businesses
      resources :required_documents, only: [:new, :create, :show], module: :businesses do
        resources :approvals, only:  [:new, :create], module: :required_documents
        resources :verifications, only: [:new, :create], module: :required_documents

      end

      resources :payments, only: [:index], module: :businesses
      resources :settings, only: [:index], module: :businesses
      resources :ownerships, only: [:new, :create, :destroy], module: :businesses
      resources :gross_sales, only: [:new, :create, :destroy], module: :businesses
      resources :business_activities, only: [:new, :create, :destroy], module: :businesses
      resources :charges, only: [:new, :create], module: :businesses
      resources :assessments, only: [:index, :new, :create], module: :businesses
      resources :requirements, only: [:index], module: :businesses

    end

  end
  resources :localities, only: [:edit, :update]
  unauthenticated :user do
    root to: "for_governments#index", as: :authenticated_user_root
  end
  resources :taxpayer_accounts, only: [:show]
  namespace :taxpayer_module do
    resources :taxpayers, only: [:show]
    resources :businesses, only: [:show] do
      resources :required_documents, only: [:show], module: :businesses
    end
  end
  resources :tricycles, only: [:index, :show] do
  end
  namespace :treasury do
    resources :cash_receipts, only: [:index, :show]
    resources :collections, only: [:index]
    resources :assessment_vouchers, only: [:index, :show] do
      resources :voucher_amounts, only: [:new, :create], module: :assessment_vouchers
    end

    namespace :assessments do
      resources :business_permit_applications, only: [:index]
      resources :tricycle_permit_applications, only: [:index]
    end
  end
  namespace :accounting do
    resources :entries, only: [:show]
  end

  resources :fire_safety_inspection_configs, only: [:index, :show] do 
    resources :accounts, only: [:new, :create, :destroy], module: :fire_safety_inspection_configs
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
