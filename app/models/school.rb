class School < ApplicationRecord
	has_many :students
	has_many :event_customers
end
