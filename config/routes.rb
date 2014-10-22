Rails.application.routes.draw do

#Product Routes
  get  "/products",                 to: "products#index",              as: :products
  get  "/products/new",             to: "products#new",                as: :new_product
  post "/products/new",             to: "products#create"
  get "/products/destroy/:id",      to: "products#destroy",            as: :destroy_product
  get "/products/:id/edit",         to: "products#edit",               as: :edit_product
  get "/products/:id/newcategory",  to: "products#newcategory",        as: :new_product_category
  put "/products/:id",              to: "products#update"
  get "/products/:id",              to: "products#show",               as: :show_product

  post "/products/:id/newcategory", to: "productcategories#create"
  delete "/products/:id/newcategory", to: "productcategories#destroy", as: :delete_category

  # Cart Routes
  get    "/cart",                   to: "carts#edit",                  as: :cart
  delete "/cart",                   to: "carts#destroy",               as: :delete_cart


  # Orders Routes
  get    "/orders",               to: "orders#index",                  as: :orders
  get    "/checkout",             to: "orders#new",                    as: :new_order
  get    "/orders/info",          to: "orders#info",                   as: :order_info
  post   "/checkout",             to: "orders#create"
  get    "/order-confirmation",   to: "orders#confirmation",           as: :order_confirmation
  get    "/orders/:id",           to: "orders#show",                   as: :show_order


  # Orderitem Routes
  post   "/orderitems/new",         to: "orderitems#create",           as: :orderitems_new
  put    "/orders/:id",             to: "orderitems#update",           as: :update_cart
  get    "/orderitem/:id/delete",   to: "orderitems#destroy",          as: :delete_orderitem
  put    "/orderitem/cancel",       to: "orderitems#cancel",           as: :cancel_orderitem
  put    "/orderitem/ship",         to: "orderitems#ship",             as: :ship_orderitem


  # Reviews Routes
  get "/products/:id/reviews/",     to: "reviews#index",               as: :product_reviews
  get "/products/:id/reviews/new",  to: "reviews#new",                 as: :new_product_review
  post "/products/:id/reviews/new", to: "reviews#create"

  # Categories Routes
  get "/categories",                to: "categories#index",            as: :categories
  get "/categories/new",            to: "categories#new",              as: :new_category
  post "/categories/new",           to: "categories#create"
  get "/categories/:id/products",   to: "categories#products",         as: :category_products

  # Product Categories Routes
  # get "/productcategories",        to: "productcategories#index",    as: :productitems_new
  # post "/productcategories/:id",   to: "productcategories#create"

  # Users Routes
  get "/users/new",                 to: "users#new",                   as: :new_user
  post "/users",                    to: "users#create"
  #get "/logins",                    to: "logins#create"
  post "/sessions",                 to: "logins#create"
  delete "/sessions",               to: "logins#destroy"
  #get "/users/test",                to: "users#test"
  get "/logins/new",                to: "logins#new",                  as: :new_login
  get "/logins/destroy",            to: "logins#destroy",              as: :logoff
  get "/users/edit",                to: "users#edit",                  as: :edit_user
  get "/users/profile",             to: "users#profile",               as: :user_profile
  get "/users/orderfulfillment",    to: "users#orderfulfillment",      as: :user_orderfulfillment
  post "/users/orderfulfillment",   to: "users#orderfulfillment"
  put "/users/:id",                 to: "users#update"
  get "/users/:id/user_category",   to: "users#user_category"

  root "home#index"


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
