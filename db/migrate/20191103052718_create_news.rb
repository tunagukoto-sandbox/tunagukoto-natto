class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :main_body
      t.text :sub_body
      t.boolean :open
      t.string :link_url

      t.timestamps
    end
  end
end
