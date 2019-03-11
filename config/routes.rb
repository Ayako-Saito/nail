Rails.application.routes.draw do
  get 'sessions/new'

  root 'pages#index' # pagesコントローラのindexアクションを呼ぶ  トップページのルーティング
  get 'pages/index'

  get    '/login',   to: 'sessions#new'     # ログインするためのフォームを表示
  post   '/login',   to: 'sessions#create'  # 新しくメールアドレスやパスワード送信してもらい、データをもとにSessionを作成
  delete '/logout',  to: 'sessions#destroy' # ログアウトでSessionを削除

  resources :users
  resources :topics

end
