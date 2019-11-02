class Style < ApplicationRecord
	has_many :style_events
	has_many :events, through: :style_events
end
