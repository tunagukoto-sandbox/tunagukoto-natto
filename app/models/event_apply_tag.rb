class EventApplyTag < ApplicationRecord
	belongs_to :event_customer
	belongs_to :student
end
