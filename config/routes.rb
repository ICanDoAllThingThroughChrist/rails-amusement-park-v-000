Rails.application.routes.draw do
get    '/signin',   to: 'sessions#new'#1
post   '/signin',   to: 'sessions#create'
delete '/signout',  to: 'sessions#destroy'
root 'welcome#home'
resources :attractions, :users
end
#1-https://www.railstutorial.org/book/basic_login
