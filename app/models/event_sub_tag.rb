class EventSubTag < ApplicationRecord
  belongs_to :event
  belongs_to :sub_tag
end
