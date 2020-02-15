class MiniQuestion < ApplicationRecord
	belongs_to :student
    has_many :mini_question_student_groups 
    has_many :student_groups, through: :mini_question_student_groups
end
