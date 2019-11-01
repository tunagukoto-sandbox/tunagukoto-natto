class School < ApplicationRecord
	has_many :students
	has_many :event_customers
	has_many :mini_event_customers
end
