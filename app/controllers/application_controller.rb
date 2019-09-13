class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
      	case resource
	      	when Admin
	        	home_admin_top_path
	      	when Student
	        	root_path
   		end
  	end

end
