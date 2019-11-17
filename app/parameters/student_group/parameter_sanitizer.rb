class StudentGroup::ParameterSanitizer < Devise::ParameterSanitizer	  
	def initialize(*)
		super
        # 新規登録時のパラメーター
		permit(:sign_up, keys: [
			:email,
			:password, 
			:password_confirmation,
      :name_ja,
      :name_en,
      :activity_detail_ja,
      :performance_ja,
      :activity_detail_en,
      :performance_en,
      :membership,
      :home_page_url,
      :top_img
		])   
        # ユーザー情報アップデート時のパラメーター
    permit(:account_update, keys: [
      :email,
      :password, 
      :password_confirmation,
      :name_ja,
      :name_en,
      :activity_detail_ja,
      :performance_ja,
      :activity_detail_en,
      :performance_en,
      :membership,
      :home_page_url,
      :top_img
		]) 
	end
end
# {:college_ids => []}
# user_colleges: [college_ids:[]] 
# colleges: []
# 参考に
# permit(:sign_up, keys: [:clubname, :clubtype, :text, :population, :profile_img , {:college_ids => []} ])   