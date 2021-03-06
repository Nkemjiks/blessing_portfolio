Rails.application.routes.draw do
  devise_for :users, path: "", path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }
  resources :portfolios do
    put :sort, on: :collection
  end
  get "about-me", to: "pages#about"
  get "contact", to: "pages#contact"
  resources :blogs do
    member do
      put :toggle_status
    end
  end
  root "pages#home"
end
