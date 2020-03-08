class MiniEventCustomer < ApplicationRecord
	belongs_to :school
	belongs_to :mini_event
	has_one :mini_event_apply_tag
end
