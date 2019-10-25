class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
      	case resource
	      	when Admin
	        	home_admin_top_path
	      	when Student
	        	root_path
	        when Corporation
	        	root_path
   		end
  	end
    protected

	  def devise_parameter_sanitizer
	  	if resource_class == Student
	  		Student::ParameterSanitizer.new(Student, :student, params) 
	  	elsif resource_class == Corporation
	  		Corporation::ParameterSanitizer.new(Corporation, :corporation, params) 
	  	else
	  		super # Use the default one
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
		    else
		        authenticate_student! || authenticate_corporation!
		    end
		end

end
