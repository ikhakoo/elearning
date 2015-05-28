Rails.application.routes.draw do

  devise_for :users

  resources :enrollments, only: :index

  resources :courses do
    # resources :lessons
    resources :enrollments, only: [:new, :create]
    resources :lessons, shallow: true do
      resources :chapters, shallow: true
    end
	end

  # get 'courses/:course_id/enrollments/new', to: 'enrollments#new', as: :new_course_enrollment
  get 'markdowns/:page_id', to: 'markdowns#show', as: :markdown
  

  root :to => "dashboard#front"

  get '/front', to: 'dashboard#front'
  get '/tracks', to: 'dashboard#tracks'
  get '/private_help', to: 'dashboard#private_help'
  get '/material', to: 'dashboard#material'
  get '/students', to: 'dashboard#students'
  get '/test', to: 'dashboard#test'

end
