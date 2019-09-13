class CreateEventSubTags < ActiveRecord::Migration[5.2]
  def change
    create_table :event_sub_tags do |t|
      t.references :event, foreign_key: true
      t.references :sub_tag, foreign_key: true

      t.timestamps
    end
  end
end
