Rails.application.routes.draw do
  devise_for :admin_users, path: 'admin'

  resource :admin do
    resources :companies do
      resources :company_users
    end
  end

  devise_for :company_users, path: 'company'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'examples#index'

  resources :examples, only: :index do
    get :buttons, :cards, :utilities_color, :utilities_border,
        :utilities_animation, :utilities_other, :login, :register,
        :forgot_password, :page_404, :blank, :charts, :tables,
        on: :collection
  end
end
