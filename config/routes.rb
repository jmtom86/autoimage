Rails.application.routes.draw do
  get 'roll/index'

  get 'roll/new'

  get 'roll/create'
  post 'rolls' => 'roll#create'
  delete 'rolls/:id' => 'roll#destroy'
  get 'rolls/:id' => 'roll#show'

  get 'jobs/create'
  get 'jobs/new'
  get 'jobs/index'
  get 'jobs/new/:id' => 'jobs#new'
  get 'jobs/:id' => 'jobs#show'
  post 'jobs' => 'jobs#create'

  get 'customers/create'
  get 'customers/new'
  get 'customers/:id/edit' => 'customers#edit'
  get 'customers/index'
  post 'customers' => 'customers#create'
  get 'customers/:id' => 'customers#show'
  patch 'customers/:id' => 'customers#update'
  delete 'customers/:id' => 'customers#destroy'

  get 'main/index'

  get 'main' => 'main#index'
  get 'main/create'

  get 'sessions/create'
  post 'sessions' => 'sessions#create'
  get 'sessions/index'
  delete 'sessions' => 'sessions#destroy'
  root 'sessions#index'

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
