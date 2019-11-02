class AddPointInfoToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :get_point, :integer
    add_column :events, :pay_point, :integer
  end
end
