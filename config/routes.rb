Rails.application.routes.draw do
  	root 'home#top'

  	get 'home/policy'

  	get 'home/privacy'

  	get 'home/comming_soon'

  	get 'home/admin_mini_event'

 	get 'home/admin_top'

 	get 'home/admin_event'

 	get 'home/registrations'

 	get 'home/natto'

 	get 'home/others'

 	get 'home/studey_event'

 	get 'home/interact_event'
 	
 	get 'organizations/student_group'

  	get 'organizations/non_profit'

  	get 'student_page/student_event/:id', to: 'student_page#student_event', as: 'student_event_page'

 	post 'home/event_send_mail/:id', to: 'home#event_send_mail', as: 'home_event_send_mail'

 	post 'home/mini_event_send_mail/:id', to: 'home#mini_event_send_mail', as: 'home_mini_event_send_mail'

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

  	devise_for :non_profit_organizations, :controllers => {
	  :registrations => 'non_profit_organizations/registrations',
	  :sessions => 'non_profit_organizations/sessions'   
	}

  	devise_for :student_groups, :controllers => {
	  :registrations => 'student_groups/registrations',
	  :sessions => 'student_groups/sessions'   
	} 

	resources :student_page, only: [:show, :index]
	resources :company_page, only: [:show, :index]

	resources :event_apply_tag, only: [:update]
	resources :mini_event_apply_tag, only: [:update]

  	resources :student_statuses, only: [:edit, :update]
	resources :events
	resources :news
	resources :mini_events

	resources :mini_events, only: [:show] do
		resources :mini_event_customers, only: [:new, :create]
	end
	
	resources :event_customers, only: [:new, :create, :destroy, :edit, :update]

	resources :sub_tags

	resources :schools

	resources :quests


	get '/quests_other/new_quest', to: 'quests#new_quest'

	get '/quests_other/old_quest', to: 'quests#old_quest'

	get '/quests_other/quest_notice', to: 'quests#quest_notice'
  	
	resources :student_page do
		resources :admin_points, only: [:new, :create, :edit, :update]
	end
	
	resources :mini_event_customers, only: [:destroy, :edit, :update]

	# 以下質問箱
	resources :questions do
		resources :comments
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
