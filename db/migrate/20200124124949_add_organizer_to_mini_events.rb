class AddOrganizerToMiniEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :mini_events, :organizer, :string
  end
end
