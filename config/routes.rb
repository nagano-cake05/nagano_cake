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
    get '/' => 'homes#top'
  end

  get 'customers/mypage' => 'public/customers#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
