Rails.application.routes.draw do
  # For details on the DSL available within this file,see https://guides.rubyonrails.org/routing.html

  # devise を使用する際にURLとして users を含む
  # ーザー認証機能に関連するルーティングを自動的に追加するためのコード
  devise_for :users

  root to:"homes#top"
  get 'homes/about', as:'about'

  # コメント機能のルーティング自動作成
  # post_commentsとpost_images&favoriteは親子関係
  resources :post_images, only: [:index, :new, :create, :show, :destroy] do
    resource :favorite, only:[:create, :destroy]
    resources :post_comments, only: [:create]
  end
  
  # usersのルーティング自動作成
  resources :users, only: [:show, :edit, :update]

end
