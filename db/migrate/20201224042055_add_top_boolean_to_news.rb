class AddTopBooleanToNews < ActiveRecord::Migration[5.2]
  def change
    #topのバナーに出すかどうか？
    add_column :news, :top, :boolean
  end
end
