Rails.application.routes.draw do

  devise_for :users

  resources :charges

  resources :enrollments, only: :index

  resources :courses do
    # resources :lessons
    resources :lessons do
      resources :chapters #do
        # get 'student_progress', :on => :collection
        # post 'student_progress', :on => :collection
      #end
    end
    resources :enrollments, only: [:new, :create]
	end

  resources :interactives

  # get 'courses/:course_id/enrollments/new', to: 'enrollments#new', as: :new_course_enrollment
  get 'markdowns/:page_id', to: 'markdowns#show', as: :markdown
  

  root :to => "dashboard#front"

  get '/front', to: 'dashboard#front'
  get '/tracks', to: 'dashboard#tracks'
  get '/private_help', to: 'dashboard#private_help'
  get '/material', to: 'dashboard#material'
  get '/students', to: 'dashboard#students'

  match 'student_progress' => 'chapters#student_progress', :as =>'student_progress', via: [:get, :post]

end
