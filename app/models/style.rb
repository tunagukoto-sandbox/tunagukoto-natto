class Style < ApplicationRecord
	has_many :style_events
	has_many :events, through: :style_events
	has_many :mini_event_styles
	has_many :mini_events, through: :mini_event_styles
end
