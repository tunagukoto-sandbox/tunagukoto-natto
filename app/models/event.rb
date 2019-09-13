class Event < ApplicationRecord
	has_many :event_tags
	has_many :tags, through: :event_tags
	has_many :event_sub_tags
	has_many :sub_tags, through: :event_sub_tags
	has_one_attached :event_top_image
	has_one_attached :event_show_image
	has_one_attached :president_image



	def self.delete_event(event)
		event_tag = EventTag.where(event_id: event.id)
		event_tag.delete_all if event_tag != nil 
		event_sub_tag = EventSubTag.where(event_id: event.id)
		event_sub_tag.delete_all if event_sub_tag != nil
	end


end
