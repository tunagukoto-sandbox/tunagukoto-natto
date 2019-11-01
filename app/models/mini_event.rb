class MiniEvent < ApplicationRecord
	belongs_to :corporation, optional: true
	belongs_to :student, optional: true
	has_many :mini_event_customers
	has_one_attached :mini_event_img

end
