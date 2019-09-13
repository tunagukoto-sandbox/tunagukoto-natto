class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :c_body
      t.references :question, foreign_key: true
      t.references :company
      t.references :student

      t.timestamps
    end
  end
end
