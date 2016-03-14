Rails.application.routes.draw do
  get 'contacts/index'

  get 'news/index'

  get 'questions/index'

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts
  get 'news', to: 'news#index'
  get 'questions', to: 'questions#index'
  get 'contacts', to: 'contacts#index'

  resources :products do
    get :who_bought, on: :member
  end


  root to: 'magazine#index', as: 'magazine'

end
