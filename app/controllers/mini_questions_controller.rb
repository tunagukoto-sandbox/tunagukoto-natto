class MiniQuestionsController < ApplicationController
  before_action :send_mini_question, except: [:create]
  def create

  	student_group_ids = params["student_group_ids"]["student_group_id"]
  	student_group_ids.delete("")
  	student_group_ids = student_group_ids.map(&:to_i)
  	student_id = current_student.id
  	menber_name = params["mini_question"]["menber_name"]

  	if params["q"] == "yes"
		m = MiniQuestion.new(
			student_id: student_id,
			check: true,
			menber_name: menber_name,
			year:  Time.now.year,
			month: Time.now.month
		)
		if m.save
			student_group_ids.each do |s_id|
				MiniQuestionStudentGroup.create(
					mini_question_id: m.id,
					student_group_id: s_id
				)
			end
		end
		flash[:success] = 'アンケートのご協力ありがとうございました！'
		redirect_to root_path
  	elsif params["q"] == "no"
  		# アンケート該当なし
		m = MiniQuestion.new(
			student_id: student_id,
			check: false,
			menber_name: "なし",
			year:  Time.now.year,
			month: Time.now.month
		)
		if m.save
			flash[:success] = 'アンケートのご協力ありがとうございました！'
			redirect_to root_path
		else
			redirect_to home_questionnaire_path
		end
  	else
  		flash[:success] = '必須項目を入力してください。'
  		redirect_to home_questionnaire_path
  	end
  	@mini_question = MiniQuestion.new
  end
end