class Quest < ApplicationRecord
	has_one_attached :company_logo
	has_one_attached :quest_image
end
