class AddEventSelectToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_select, :string
  end
end
