class Comment < ApplicationRecord
	belongs_to :company, optional: true
	belongs_to :student, optional: true
	belongs_to :question
end
