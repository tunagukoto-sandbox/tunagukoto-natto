class Article < ApplicationRecord
    has_one_attached :img
    belongs_to :event
end
