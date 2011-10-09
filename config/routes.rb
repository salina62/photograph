Photograph::Application.routes.draw do
 
 

  get "adminusersession/create"

  get "adminusersession/destroy"

  

  resources :adminusers

  resources :mainusers

  get 'adminuserpage' => 'adminuserpage#index'

  controller :adminusersession do
    get 'adminuserlogin' => :new
    post 'adminuserlogin' => :create
   delete 'adminuserlogout' => :destroy
  end

  get 'mainuserpage' => 'mainuserpage#index'

  controller :mainusersession do
    get 'userlogin' => :new
    post 'userlogin' => :create
   delete 'userlogout' => :destroy
  end

    get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
   delete 'logout' => :destroy
end

  scope '(:locale)' do
  resources :users

  resources :orders

  resources :line_items

  resources :carts
  
  resources :photos do
    get :who_bought, :on => :member
    get :sample_image, :on => :member
    get :original_image, :on => :member
    
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'photos/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => photo.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :photos

  # Sample resource route with options:
  #   resources :photos do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :photos do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :photos do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::photosController
  #     # (app/controllers/admin/photos_controller.rb)
  #     resources :photos
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
  root :to => 'store#index', :as => 'store'

  end
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "store/index"


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
