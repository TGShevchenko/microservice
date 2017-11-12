Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hooks, :controller => :webhooks, :action => :receive do
    post :receive
  end	
end
