Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :books
    
    devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: "registrations"
    }

    devise_scope :user do
      delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destory_user_session
    end
end
