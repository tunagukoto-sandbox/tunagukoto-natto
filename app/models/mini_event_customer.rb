class MiniEventCustomer < ApplicationRecord
	belongs_to :school
	belongs_to :mini_event
	# belongs_to :student
end
