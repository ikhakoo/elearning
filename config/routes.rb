Rails.application.routes.draw do

  devise_for :users

  resources :courses do
  	resources :enrollments
  	resources :lessons
	end

  get 'markdowns/:page_id', to: 'markdowns#show', as: :markdown


  root :to => "dashboard#front"

  get '/front', to: 'dashboard#front'
  get '/tracks', to: 'dashboard#tracks'

end
