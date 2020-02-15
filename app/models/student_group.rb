class StudentGroup < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :top_img
  has_many :mini_question_student_groups 
  has_many :mini_questions, through: :mini_question_student_groups
end
