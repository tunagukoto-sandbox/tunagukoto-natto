class Student::ParameterSanitizer < Devise::ParameterSanitizer	  
	def initialize(*)
		super
        # 新規登録時のパラメーター
		permit(:sign_up, keys: [
			:email,
			:password, 
			:password_confirmation,
			:name, 
			:major_subject,
			:entrance_year, 
			:home_town, 
			:club,
			:experienced_jobs,
			:hobbies,
			:introduction,
			:free_space,
			:sns_url,
			:school_id
		])   

        # ユーザー情報アップデート時のパラメーター
        permit(:account_update, keys: [
        	:email,
			:password, 
			:password_confirmation,
        	:name, 
			:major_subject,
			:entrance_year, 
			:home_town, 
			:club,
			:experienced_jobs,
			:hobbies,
			:introduction,
			:free_space,
			:sns_url,
			:school_id
		]) 
	end
end
# {:college_ids => []}
# user_colleges: [college_ids:[]] 
# colleges: []
# 参考に
# permit(:sign_up, keys: [:clubname, :clubtype, :text, :population, :profile_img , {:college_ids => []} ])   