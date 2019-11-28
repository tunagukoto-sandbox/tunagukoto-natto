class AddColumnToQuest < ActiveRecord::Migration[5.2]
  def change
    add_column :quests, :corporation_id, :integer
    add_column :quests, :closing, :date
    add_column :quests, :finish, :boolean
  end
end
