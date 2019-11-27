class CreateAdminPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_points do |t|
		t.references :student, foreign_key: true
		t.integer :change_value
		t.string :add_or_take
		t.text :reason
      t.timestamps
    end
  end
end
