class Comment < ApplicationRecord
	belongs_to :corporation, optional: true
	belongs_to :student, optional: true
	belongs_to :question
end
