class CreateMiniQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :mini_questions do |t|
      t.integer :student_id
      t.boolean :check
      t.text :menber_name
      t.integer :year
      t.integer :month

      t.timestamps
    end
  end
end
