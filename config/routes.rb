Rails.application.routes.draw do

  # Orders Routes
  get    "/orders",               to: "orders#index" #currently redirected... a-okay?
  get    "/cart",                 to: "orders#edit",        as: :cart
  post   "/orders/new",           to: "orders#create"
  delete "/orders/:id",           to: "orders#destroy",     as: :delete_order

  # get    "/checkout",             to: "orders#checkout",    as: :checkout
  # get    "/order-confirmation",   to: "orders#show",        as: :show_order

  # Orderitem Routes
  post   "/orderitems/new",       to: "orderitems#new",     as: :orderitems_new
  put    "/orders/:id",           to: "orderitems#update",  as: :update_order
  get    "/orderitem/:id/delete", to: "orderitems#destroy", as: :delete_orderitem

  root "home#index"

  #############################################################################
  # Kristina's Routes for Testing!!                                           #
  #############################################################################
  get "/clear", to: "orders#clear"
  get "/testing-order", to: "orders#set_order_session"
  #############################################################################

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
