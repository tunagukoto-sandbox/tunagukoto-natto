class Question < ApplicationRecord
	belongs_to :company, optional: true
	belongs_to :student, optional: true
	has_many :comments
end
