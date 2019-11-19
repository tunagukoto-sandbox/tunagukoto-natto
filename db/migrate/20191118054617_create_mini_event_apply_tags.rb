class CreateMiniEventApplyTags < ActiveRecord::Migration[5.2]
  def change
    create_table :mini_event_apply_tags do |t|
    	t.integer :mini_event_id
    	t.integer :student_id
    	t.boolean :has_paid
    	t.boolean :pay_point
    	t.boolean :pay_cash
      t.timestamps
    end
  end
end
