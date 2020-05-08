Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admin_users, path: 'admin'

  authenticate :admin_user do
    namespace :admin do
      get '/', to: '/admin/admin#index'

      resources :companies do
        resources :company_users
      end
  
      resources :categories
    end
  end

  devise_for :company_users, path: 'company'

  authenticate :company_user do
    namespace :company do
      get '/', to: 'company/company#index'
    end
  end

  namespace :api do
    resources :categories, only: [:index, :show]
    resources :companies, only: [:index, :show]
  end

  root 'company/company#index'

  resources :examples, only: :index do
    get :buttons, :cards, :utilities_color, :utilities_border,
        :utilities_animation, :utilities_other, :login, :register,
        :forgot_password, :page_404, :blank, :charts, :tables,
        on: :collection
  end
end
