Rails.application.routes.draw do
  scope :api, defaults: {format: 'json'} do
    resources :stories, except: [:new, :edit]
  end
end
