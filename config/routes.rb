Rails.application.routes.draw do
  get 'pages/index'
  root 'pages#index' #pagesコントローラのindexアクションを呼ぶ  トップページのルーティング
end
