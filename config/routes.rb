Rails.application.routes.draw do
  resources :message_items, only: [:index, :create]
  get '/livechat' => 'chat_room#livechat'
  root to: 'visitors#index'
end
