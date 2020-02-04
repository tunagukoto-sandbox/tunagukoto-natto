class CreateMiniQuestionStudentGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :mini_question_student_groups do |t|
      t.integer :mini_question_id
      t.integer :student_group_id

      t.timestamps
    end
  end
end
