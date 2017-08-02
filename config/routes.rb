Rails.application.routes.draw do
  controller :forms do
    post "call-me", as: :call_request, action: :call_request
    post "session-order", as: :session_order, action: :session_order
    post "home-order", as: :home_order, action: :home_order
  end

  mount Cms::Engine => '/'

  root as: "root_without_locale", to: "application#root_without_locale"
  get "robots", to: "cms/robots#robots_txt", as: :robots_txt, format: "txt"
  get "admin(/*admin_path)", to: redirect{|params| "/#{ I18n.default_locale}/admin/#{params[:admin_path]}"}

  localized do
    root to: "pages#index"
    devise_for :users, skip: :omniauth_callbacks, module: "users", path: "", path_names: {
        sign_in: "login",
        sign_out: 'logout',
    }
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end



  mount Ckeditor::Engine => '/ckeditor'

  match "*url", to: "application#render_not_found", via: [:get, :post, :path, :put, :update, :delete]
end