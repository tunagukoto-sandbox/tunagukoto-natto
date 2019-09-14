class Corporation::ParameterSanitizer < Devise::ParameterSanitizer	  
	def initialize(*)
		super
        # 新規登録時のパラメーター
		permit(:sign_up, keys: [
			:email,
			:password, 
			:password_confirmation,
		    :name,
		   	:locate,
		    :start_year,
		    :number_of_employee,
		    :what_we_do,
		    :attractive_point
		])   

        # ユーザー情報アップデート時のパラメーター
        permit(:account_update, keys: [
        	:email,
			:password, 
			:password_confirmation,
		    :name,
		   	:locate,
		    :start_year,
		    :number_of_employee,
		    :what_we_do,
		    :attractive_point
		]) 
	end
end