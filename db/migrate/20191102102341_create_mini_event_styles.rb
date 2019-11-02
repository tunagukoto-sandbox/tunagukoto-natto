class CreateMiniEventStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :mini_event_styles do |t|
      t.references :mini_event, foreign_key: true
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
