Rails.application.routes.draw do

  # devise を使用する際にURLとして users を含む
  # ーザー認証機能に関連するルーティングを自動的に追加するためのコード
  devise_for :users

  # For details on the DSL available within this file,see https://guides.rubyonrails.org/routing.html

  root to:"homes#top"

  # posr_imageのルーティング自動作成
  resources :post_images, only: [:new, :create, :index, :show]
  
   get 'homes/about', as:'about'

end
