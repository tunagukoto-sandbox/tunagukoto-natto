class SubTag < ApplicationRecord
	has_many :event_sub_tags
	has_many :events, through: :event_sub_tags
end
