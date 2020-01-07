class MiniEventApplyTag < ApplicationRecord
	belongs_to :mini_event_customer
	belongs_to :student
end
