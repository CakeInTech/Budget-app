Rails.application.routes.draw do
  get 'splash_screen/index'
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  
  resources :users do
   resources :categories, controller: 'groups', as: 'groups' do
      resources :transactions, controller: 'expenses', as: 'expenses'
    end
  end
end