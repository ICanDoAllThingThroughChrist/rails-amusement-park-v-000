Rails.application.routes.draw do
resources :attractions, :users
get     '/signin',    to: 'sessions#new'#1
post    '/signin',    to: 'sessions#create'
get     '/logout',    to: 'sessions#destroy'
root    'welcome#home'
end
#1-https://www.railstutorial.org/book/basic_login
