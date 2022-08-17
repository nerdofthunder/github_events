# frozen_string_literal: true

Rails.application.routes.draw do
  get 'repository_events/index'
  get 'repository_events/search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'repository_events#index'
end
