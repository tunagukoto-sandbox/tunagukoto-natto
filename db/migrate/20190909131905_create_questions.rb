class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :title
      t.text :q_body
      t.references :company
      t.references :student
      
      t.timestamps
    end
  end
end
