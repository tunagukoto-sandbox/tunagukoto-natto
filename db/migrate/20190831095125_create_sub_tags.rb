class CreateSubTags < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_tags do |t|
      t.string :sub_tag_name

      t.timestamps
    end
  end
end
