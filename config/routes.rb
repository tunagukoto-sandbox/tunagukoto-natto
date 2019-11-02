Rails.application.routes.draw do

  	root 'home#top'

  	get 'home/policy'

  	get 'home/privacy'

  	get 'home/admin_mini_event'

 	get 'home/admin_top'

 	get 'home/admin_event'

 	get 'home/natto'

 	get 'home/others'

 	patch 'mini_event_customer/update/:id', to: 'points#update_point', as: 'update_point'
 	patch 'mini_event_customer/rollback/:id', to: 'points#rollback_point', as: 'rollback_point'

 	patch 'event_customer/update/:id', to: 'points#update_point_event', as: 'update_point_event'
 	patch 'event_customer/rollback/:id', to: 'points#rollback_point_event', as: 'rollback_point_event'

	devise_for :students, :controllers => {
	  :registrations => 'students/registrations',
	  :sessions => 'students/sessions'   
	} 


	devise_for :admins, :controllers => {      
	  :sessions => 'admins/sessions'   
	} 

  	devise_for :corporations, :controllers => {
	  :registrations => 'corporations/registrations',
	  :sessions => 'corporations/sessions'   
	} 


	resources :student_page, only: [:show, :index]
	resources :company_page, only: [:show, :index]

  	resources :student_statuses, only: [:edit, :update]
	resources :events
	resources :mini_events

	resources :event_customers, only: [:new, :create, :destroy, :edit, :update]

	resources :sub_tags

	resources :schools

	resources :quests

	resources :mini_event_customers, only: [:new, :create, :destroy, :edit, :update]

	# 以下質問箱
	resources :questions do
		resources :comments
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
