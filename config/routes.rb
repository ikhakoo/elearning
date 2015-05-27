Rails.application.routes.draw do

  devise_for :users

  resources :enrollments, only: [:index, :new]

  resources :courses

  resources :courses do
  	resources :lessons
	end

  resources :courses do
    resources :enrollments, only: [:index, :new, :create]
  end


  # get 'courses/:course_id/enrollments/new', to: 'enrollments#new', as: :new_course_enrollment
  get 'markdowns/:page_id', to: 'markdowns#show', as: :markdown


  root :to => "dashboard#front"

  get '/front', to: 'dashboard#front'
  get '/tracks', to: 'dashboard#tracks'
  get '/interactive', to: 'dashboard#interactive'
  get '/material', to: 'dashboard#material'

end
