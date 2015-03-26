Rails.application.routes.draw do

  # Doesn't have to be named index. As long as the filename matches with below.
  # The as: :about defines helper method. So instead of typing:
  # link_to "About", "/about"
  # you can type instead:
  # link_to "About", about_path
  # More about the as: :
  # http://stackoverflow.com/questions/4696229/as-in-rails-routes-rb
  get "/about" => "about#index", as: :about

  get "/contact" => "contact#index", as: :contact

  post "/contact" => "contact#create"

  # As soon as the route finds a get method that matches the request, it will stop looking. Therefore, /welcome/hello will return below, and routes.rb will stop looking at other routes.
  get "/welcome/hello" => "welcome#hello", as: :hello_welcome

  get "/welcome/:name" => "welcome#show", as: :welcome

  # All the routes inside the scope block will have a "/admin" prefix
  # To create the controller in Terminal:
  # bin/rails generate controller admin/questions
  # Place the html.erb file in /views/admin/questions
  scope :admin do
    # even inside a scope, this will still look for questions_controller
    get "/questions" => "questions#index"
  end

  # all the routes inside the admin namespace will have a "/admin prefix. Will also look for controllers inside an "admin" folder inside the "controllers" folder
  namespace :admin do
    get "/questions" => "questions#index"
  end

  # VERY IMPORTANT: Notice that the syntax is different from the above:
  # NO hash rocket, AND NO url path
  # If the syntax is wrong, then some Terminal commands won't work:
  # "generate controller", starting postgreSQL, etc.
  root "welcome#index"


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
