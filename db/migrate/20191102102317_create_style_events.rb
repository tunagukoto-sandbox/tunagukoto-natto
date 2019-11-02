class CreateStyleEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :style_events do |t|
      t.references :event, foreign_key: true
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
