class EventCustomer < ApplicationRecord
	belongs_to :school
	belongs_to :event
	belongs_to :student
	has_one :event_apply_tag
	# belongs_to :student, optional: true
end
