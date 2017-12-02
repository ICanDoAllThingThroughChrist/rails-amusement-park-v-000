Rails.application.routes.draw do
get    '/login',   to: 'sessions#new'#1
post   '/login',   to: 'sessions#create'
delete '/logout',  to: 'sessions#destroy'
root 'welcome#home'
resources :attractions, :users
end
#1-https://www.railstutorial.org/book/basic_login
