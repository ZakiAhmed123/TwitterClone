Rails.application.routes.draw do

  root 'homepage#new'

  get 'sign_in' => 'session#new', as: :sign_in
  post 'sign_in' => 'session#create'
  get 'sign_out' => 'session#delete', as: :sign_out

  get "/users/new" => 'users#new', as: :sign_up
  post "/users/new" => 'users#create', as: :users

  get 'users/:id/timeline' => 'users#timeline', as: :timeline
  get 'users/index/:id' => 'users#show', as: :user
  get 'users/index' => 'users#index', as: :index

  post 'users/index/:id/follow' => 'following#create', as: :follow
  post 'users/index/:id/unfollow' => 'following#delete', as: :unfollow

  get 'users/:id/timeline' => 'users#timeline', as: :posts
  post 'users/:id/timeline' => 'users#create_post'

  post 'users/:id/timeline' => 'users#upvotes', as: :upvote_post
  post 'users/:id/timeline' => 'users#downvotes', as: :downvote_post
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
