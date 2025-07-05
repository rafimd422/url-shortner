Rails.application.routes.draw do
  root "short_urls#new"

  resources :short_urls, only: [:new, :create]

  # This route catches short codes and redirects
  get '/:short_code', to: 'short_urls#show', as: :short
end