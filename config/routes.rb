Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'


  namespace :admin do
    root to: 'admin/homes#top'
    resources :products
    
   end
   
  namespace :public do
    get '/' => 'homes#top'
    get "home/about" => "homes#about", as: "about"
    resources :customers, only: [:show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
