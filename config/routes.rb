Rails.application.routes.draw do


  # devise_for :users
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :charges

  resources :enrollments, only: :index

  resources :courses do
    # resources :lessons
    resources :lessons do
      resources :chapters do
        get 'student_progress', :on => :member
        post 'student_progress', :on => :member
      end
    end
    resources :enrollments, only: [:new, :create]
	end

  resources :interactives do
    member do
      post 'authenticate'
    end
  end

  # get 'courses/:course_id/enrollments/new', to: 'enrollments#new', as: :new_course_enrollment
  get 'markdowns/:page_id', to: 'markdowns#show', as: :markdown


  root :to => "dashboard#front"

  get '/front', to: 'dashboard#front'
  get '/tracks', to: 'dashboard#tracks'
  get '/private_help', to: 'dashboard#private_help'
  get '/material', to: 'dashboard#material'
  get '/students', to: 'dashboard#students', as: :students

  # match 'student_progress' => 'chapters#student_progress', :as =>'student_progress', via: [:get, :post]

  delete '/user/:id', to: 'dashboard#destroy', as: :delete_user

  get '/user/instructor/new', to: 'dashboard#new_instructor', as: :new_instructor
  post '/user/instructor/new', to: 'dashboard#create_instructor'

end
