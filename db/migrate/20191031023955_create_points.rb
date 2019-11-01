class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :student_id
      t.string :student_name
      t.integer :max_point
      t.integer :having_point

      t.timestamps
    end
  end
end
