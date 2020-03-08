Rails.application.routes.draw do
  root "homes#top"
  get "home/about" => "homes#about"
#  get "/:room_id/chats/:id" => 'chats#show', as: :room
  devise_for :users
  resources :books , only: [:index, :show, :edit, :create,  :update, :destroy]
  resources :users , only: [:index, :show, :edit, :update]
  resources :chats , only: [:create, :show] do
    member do
      post :make_room
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
