# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get '/readme_preview', to: 'home#readme_preview'
  devise_for :users
end
