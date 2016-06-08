Rails.application.routes.draw do
  root to: 'selector#index'

  get 'selector/index'

  post 'preview' => 'selector#preview'
  patch 'preview_formatted' => 'selector#preview_formatted'
end
