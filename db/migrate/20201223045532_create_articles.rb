class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :event_id
      t.string :title
      t.text :linked_url
      t.boolean :open
      t.timestamps
    end
  end
end
