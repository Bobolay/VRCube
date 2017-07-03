Rails.application.routes.draw do
  root to: "pages#index"

  controller :pages do
  end

  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end