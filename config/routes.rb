Rails.application.routes.draw do
  root "short_urls#new"

  resources :short_urls, only: [:new, :create]

  get '/:short_code', to: 'short_urls#show', as: :short
  get '/display/:short_code', to: 'short_urls#display', as: :short_url_display

end
