class AddFinishToMiniEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :mini_events, :finish, :boolean
  end
end
