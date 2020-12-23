class Event < ApplicationRecord
	belongs_to :tag
	has_many :event_sub_tags
	has_many :event_customers
	has_many :sub_tags, through: :event_sub_tags
	has_many :style_events
	has_many :styles, through: :style_events
	has_one_attached :event_top_image
	has_one_attached :event_show_image
	has_one_attached :president_image
	has_one :article

	def self.delete_event(event)
		event_sub_tag = EventSubTag.where(event_id: event.id)
		event_sub_tag.delete_all if event_sub_tag != nil
	end
end

