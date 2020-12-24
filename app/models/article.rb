class Article < ApplicationRecord
    has_one_attached :article_img
    belongs_to :event
end
