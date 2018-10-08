Rails.application.routes.draw do
  get 'howtouse' => 'home#howtouse'
  get 'termsofservice' => 'home#termsofservice'
  get 'privacypolicy' => 'home#privacypolicy'
  get 'contact' => 'home#contact'

  get "search" => "users#userSearch"

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  post 'logout' => 'users#logout'
  
  get ':nickname/share' => 'users#share'
  get ':nickname/outbox' => 'users#outbox'
  get ':nickname/inbox' => 'users#inbox'
  get ':nickname/log' => 'users#log'
  get ':nickname' => 'users#show'
  
  post ':nickname/update' => 'info#update'
  get ':nickname/edit' => 'info#edit'

  post ':nickname/create' => 'posts#create'
  get ':nickname/newreview' => 'posts#new'
  
  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
