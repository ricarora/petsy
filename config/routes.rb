Rails.application.routes.draw do

#Product Routes
  # resources :products
  # get "/products/:id",  to: "products#show"
  get  "/products",     to: "products#index"
  post "/products/new", to: "products#create"
  get  "/products/new", to: "products#new"
  get "/products/destroy/:id",  to: "products#destroy"
  get "/products/:id/edit", to: "products#edit"
  put "/products/:id", to: "products#update"

  # Cart Routes
  get    "/cart",                 to: "carts#edit",        as: :cart
  delete "/cart",                 to: "carts#destroy",     as: :delete_cart

  # Orders Routes
  get    "/orders",               to: "orders#index" #currently redirected... a-okay?
  # get    "/checkout",             to: "orders#checkout",    as: :checkout
  # post   "/checkout",             to: "orders#finalize",    as: :order_finalize
  # get    "/order-confirmation",   to: "orders#show",        as: :show_order

  # Orderitem Routes
  post   "/orderitems/new",       to: "orderitems#create",  as: :orderitems_new
  put    "/orders/:id",           to: "orderitems#update",  as: :update_cart
  get    "/orderitem/:id/delete", to: "orderitems#destroy", as: :delete_orderitem

  # Reviews Routes
  get "/reviews",                 to: "reviews#index",      as: :reviews
  get "/reviews/new",             to: "reviews#new",        as: :new_review
  post "/reviews/new",            to: "reviews#create"

  # Categories Routes
  get "/categories",              to: "categories#index",   as: :categories
  get "/categories/new",          to: "categories#new",     as: :new_category
  post "/categories/new",         to: "categories#create"

  # Users Routes
  get "/users", to: "users#new"
  post "/users", to: "users#create"
  get "/logins", to: "logins#create"
  post "/sessions", to: "logins#create"
  delete "/sessions", to: "logins#destroy"
  get "/users/test", to: "users#test"
  get "/logins/new", to: "logins#new"


  root "home#index"

###############################################################################
### Kristina's Route for Testing!!  Ignore these!                             #
###############################################################################
  get "/clear", to: "orders#clear"
###############################################################################


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
