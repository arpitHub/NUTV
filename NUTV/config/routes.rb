Rails.application.routes.draw do
  #get 'welcome' => 'pages#home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'
  
  get '/home' => 'pages#home'
  get '/entertainment' => 'pages#entertainment'
  get '/sports' => 'pages#sports'
  get '/news' => 'pages#news'
  get '/contact' => 'pages#contact'
  get '/eboard' => 'pages#eboard'
  get 'entertainment/projects' => 'project#index', as: :index
  get 'entertainment/projects' => 'project#new'
  post '/projects' => 'project#create'
  get '/entertainment/projects/:id' => 'project#show', as: :project
  get 'projects/:id/edit' => 'project#edit'
  get 'projects/:id' => 'project#edit'
  patch '/entertainment/projects/:id' => 'project#update'
  delete '/entertainment/projects/:id' => 'project#destroy', as: :delete
  get 'entertainment/projects' => 'event#index', as: :event_index
  get 'entertainment/projects' => 'event#new'
  post 'entertainment/projects' => 'event#create'
  get '/entertainment/projects/:project_id/event/:id' => 'event#show', as: :event
  get '/entertainment/projects/:project_id/event/:id/edit' => 'event#edit'
  get '/sports/projects' => "project#sportsindex"
  get '/news/projects' => "project#newsindex"
  
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'
  delete '/users/:id' => 'sessions#destroy'
  get 'admin' => 'users#index'
  
  resources :project, only: [:index, :show, :edit, :destroy]
  resources :project do
    resources :events
  end
  resources :users, only: [:index, :create, :edit, :destroy]

  #resources :event, :path => 'event'

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
