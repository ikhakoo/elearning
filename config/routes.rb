Rails.application.routes.draw do

  devise_for :users
  resources :enrollments, only: [:index, :new]
  resources :courses do
  	resources :lessons
	end

  get 'markdowns/:page_id', to: 'markdowns#show', as: :markdown


  root :to => "dashboard#front"

  get '/front', to: 'dashboard#front'
  get '/tracks', to: 'dashboard#tracks'
  get '/interactive', to: 'dashboard#interactive'

end
