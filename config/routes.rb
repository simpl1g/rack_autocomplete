Rails.application.routes.draw do
  resources :posts do
    get :autocomplete, on: :collection
  end
end
