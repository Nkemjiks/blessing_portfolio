Rails.application.routes.draw do
  resources :portfolios
  get "about-me", to: "pages#about"
  get "contact", to: "pages#contact"
  resources :blogs do
    member do
      put :toggle_status
    end
  end
  root "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
