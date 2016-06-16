Rails.application.routes.draw do
  root to: 'dashboard#show'

  resource :dashboard, only: [:show, :create], controller: "dashboard" do
    collection do
      get :custom
    end
  end
end
