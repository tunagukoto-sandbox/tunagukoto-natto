class MiniQuestionStudentGroup < ApplicationRecord
	belongs_to :mini_question
	belongs_to :student_group
end
