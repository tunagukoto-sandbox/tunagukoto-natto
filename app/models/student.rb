class Student < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable,
	 :rememberable, :trackable, :validatable, :confirmable
	belongs_to :school
	has_many :comments
	has_many :questions
	has_many :mini_events
	# has_many :mini_event_customers
	has_one :point
	has_one_attached :my_image
end
