require 'rack_posts_autocomplete'

Rails.application.routes.draw do
  # mount RackPostsAutocomplete.new, at: '/autocomplete'

  resources :posts do
    # get :autocomplete, on: :collection
  end
end
