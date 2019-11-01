class CreateMiniEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :mini_events do |t|
      t.string :title
      t.integer :student_id
      t.integer :corporation_id
      t.text :detail
      t.date :time
      t.string :time_detail
      t.integer :cost
      t.text :requirement
      t.integer :get_point
      t.integer :pay_point
      t.string :locate
      t.integer :invite_num
      t.text :mini_event_name
      t.text :free_box
      t.boolean :open

      t.timestamps
    end
  end
end
