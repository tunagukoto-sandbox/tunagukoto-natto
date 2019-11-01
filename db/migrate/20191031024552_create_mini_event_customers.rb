class CreateMiniEventCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :mini_event_customers do |t|
      t.integer :mini_event_id
      t.integer :student_id
      t.integer :school_id
      t.string :name
      t.string :email
      t.string :phone_num
      t.boolean :check

      t.timestamps
    end
  end
end
