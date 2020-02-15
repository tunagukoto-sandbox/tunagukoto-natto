class ApplicationController < ActionController::Base
# before_action :authenticate_any!, except: [:natto, :top]
	def after_sign_in_path_for(resource)
      	case resource
	      	when Admin
	        	home_admin_top_path
	      	when Student
	        	root_path
	        when Corporation
	        	root_path
	        when NonProfitOrganization
	        	root_path
	        when StudentGroup
	        	root_path
	        	
   		end
  	end

  	#application_controller.rb
	def authenticate_any!
		if admin_signed_in?
		    true
		elsif student_signed_in?
		    true
		elsif corporation_signed_in?
		    true
		elsif student_group_signed_in?
			true
		elsif non_profit_organization_signed_in?
			true
		else
		    authenticate_student! || authenticate_corporation! || authenticate_non_profit_organization! || authenticate_student_group! || authenticate_admin!
		end
	end

	
	def send_mini_question
		if student_signed_in?
			# if current_student.mini_question.nil?
			# 	redirect_to home_questionnaire_path
			# end
			unless !current_student.mini_question.nil?
			    flash[:alert] = "アンケートにお答えください"
				redirect_to home_questionnaire_path
			end
		end
	end


    protected

	  	def devise_parameter_sanitizer
	  		if resource_class == Student
	  			Student::ParameterSanitizer.new(Student, :student, params) 
	  		elsif resource_class == Corporation
		  		Corporation::ParameterSanitizer.new(Corporation, :corporation, params) 
		  	elsif resource_class == StudentGroup
		  		StudentGroup::ParameterSanitizer.new(StudentGroup, :student_group, params)
		  	elsif resource_class == NonProfitOrganization
		  		NonProfitOrganization::ParameterSanitizer.new(NonProfitOrganization, :non_profit_organization, params)
		  	else
		  		super # Use the default one
		    end
	  	end
end
