class AddContentToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :content_one, :text
    add_column :events, :content_two, :text
    add_column :events, :content_three, :text
    add_column :events, :content_four, :text
    add_column :events, :content_five, :text
    add_column :events, :other_participant_url, :text
  end
end
