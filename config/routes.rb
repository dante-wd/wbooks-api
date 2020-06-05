# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  
  mount Sidekiq::Web => '/sidekiq'

  scope module:'api',path:'api' do
    scope module:'v1',path:'v1' do
      devise_for :users,
                 path: '',
                 path_names: {
                   sign_in:       'login',
                   sign_out:      'logout',
                   registration:  'signup'
                 },
                 controllers: {
                   sessions:      'sessions',
                   registrations: 'registrations'
                 }
      resources :books, only: [:index, :show]
      resources :rents, only: [:index, :create]
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end
  end
end