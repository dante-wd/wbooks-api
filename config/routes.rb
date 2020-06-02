# frozen_string_literal: true

Rails.application.routes.draw do
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