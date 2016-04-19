Rails.application.routes.draw do
  resource :status, only: [:show], controller: 'status'

  resources :sales, only: [:index, :show, :create]
  resource :reports, only: [] do
    get :total_sales
    get :sales_per_item
  end

  root to: 'home#index'
end
