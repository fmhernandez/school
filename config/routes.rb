# -*- encoding : utf-8 -*-
DanceApp::Application.routes.draw do
  resources :subjects

  resources :student_groups

  resources :student_classes
  resources :class_students

  resources :teachers

  resources :lounges
  resources :teachers  
  resources :centers
  resources :users
  resources :sessions
  resources :students
 # resources :sessions#, :only => [:new, :create, :destroy]
  root  :to => 'sessions#new'
  match '/mainMenu', :to => 'pages#mainMenu'
  match '/userAdd', :to => 'users#new'
  match '/userClear', :to => 'users#clearUser' 
  match '/studentClear', :to => 'students#clearStudent'   
  match '/teacherClear', :to => 'teachers#clearTeacher'     
  match '/teacherAfterSubmit', :to => 'teachers#afterSubmit'       
  match '/centerClear', :to => 'centers#clear_center'     
  match '/subjectClear', :to => 'subjects#clear_subject'
  match '/loungeClear', :to => 'lounges#clear_lounge'       
  match '/StudentClassClear', :to => 'student_classes#clear_student_class'  
  match '/signout', :to => 'sessions#destroy'
 # match '/sigin', :to => 'sessions#'
  #get "pages/home"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
