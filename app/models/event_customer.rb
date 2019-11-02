class EventCustomer < ApplicationRecord
	belongs_to :school
	belongs_to :event
	# belongs_to :student, optional: true
end
