class AddFinishToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :finish, :boolean
  end
end
