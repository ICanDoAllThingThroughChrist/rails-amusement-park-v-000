Rails.application.routes.draw do
resources :attractions
resources :users
resources :rides
get     '/signin',    to: 'sessions#new'#1
post    '/signin',    to: 'sessions#create'
get     '/logout',    to: 'sessions#destroy'
post    '/rides/new', to: 'rides#create'
root    'welcome#home'
end
#1-https://www.railstutorial.org/book/basic_login
