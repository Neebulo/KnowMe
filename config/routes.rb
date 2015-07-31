Rails.application.routes.draw do

  root 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get 'posts/' => 'posts#index', as: :posts_index
  get 'posts/new' => 'posts#new', as: :post_new

  # nested comments resources
  resources :posts do
    resources :comments
  end

  get 'users/new' => 'users#new', as: :users_new
  resources :users
  resources :sessions, only: [:new, :create, :destroy]


  # get 'users/create'
  # get 'users/:id/edit' => 'users#edit', as: :edit_user
  # patch 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'

  # (alternate style for resources users/sessions with restrictions)
  # resources :users, only: [:new, :create, :index, :edit, :update]
  # resources :sessions, only: [:new, :create, :destroy]

  # (alternate style for nested comments )
  # resources :posts, only: [:new, :create, :edit, :update, :destroy, :show] do
  # resources :comments, only: [:create, :new, :edit, :update, :destroy]
  # end
  # *** end alternate style ****

  # POSTS group to destroy edit update
  # get 'posts/:id/edit' => 'posts#edit', as: :edit_post
  # patch 'posts/:id' => 'posts#update'
  # delete 'posts/:id' => 'posts#destroy'


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
