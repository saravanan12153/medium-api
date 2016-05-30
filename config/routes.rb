Rails.application.routes.draw do
  scope :api, defaults: {format: 'json'} do
    # User Routes
    mount_devise_token_auth_for 'User', at: 'auth'

    # User Stories
    resources :stories, except: [:new, :edit] do
      resources :responses, except: [:new, :edit]
    end
  end
end
