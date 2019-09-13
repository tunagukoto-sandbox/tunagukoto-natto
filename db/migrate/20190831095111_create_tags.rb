class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.integer :uuid
      t.string :tag_name
      t.text :tag_info
      t.text :tag_body

      t.timestamps
    end
  end
end
