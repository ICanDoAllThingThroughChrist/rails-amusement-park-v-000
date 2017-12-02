Rails.application.routes.draw do
root 'welcome#home'
resources :attractions, :users
end
