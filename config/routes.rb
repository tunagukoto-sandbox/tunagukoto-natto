Rails.application.routes.draw do

  	root 'home#top'

  	get 'home/policy'

 	get 'home/admin_top'

	devise_for :students, :controllers => {
	  :registrations => 'students/registrations',
	  :sessions => 'students/sessions'   
	} 

	# devise_scope :student do
	#   get "student/:id", :to => "students/registrations#detail"
	#   get "signup", :to => "students/registrations#new"
	#   get "login", :to => "students/sessions#new"
	#   delete "logout", :to => "students/sessions#destroy"
	# end

	devise_for :admins, :controllers => {
	  :registrations => 'admins/registrations',
	  :sessions => 'admins/sessions'   
	} 

	devise_for :companies, :controllers => {
	  :registrations => 'companies/registrations',
	  :sessions => 'companies/sessions'   
	} 

	# devise_scope :admin do
	#   get "admin/:id", :to => "admins/registrations#detail"
	#   get "signup", :to => "admins/registrations#new"
	#   get "login", :to => "admins/sessions#new"
	#   delete "logout", :to => "admins/sessions#destroy"
	# end

	resources :student_page, only: [:show, :index]
	resources :company_page, only: [:show, :index]
	
	resources :events

	resources :sub_tags

	resources :schools

	resources :quests

	# 以下質問箱
	resources :questions do
		resources :comments
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
