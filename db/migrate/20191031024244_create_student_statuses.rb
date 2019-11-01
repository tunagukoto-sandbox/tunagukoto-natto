class CreateStudentStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :student_statuses do |t|
      t.integer :student_id
      t.boolean :gold
      t.boolean :silver
      t.boolean :normal
      t.boolean :ambassador
      t.boolean :start_up

      t.timestamps
    end
  end
end
