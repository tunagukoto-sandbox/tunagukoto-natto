class CreateQuests < ActiveRecord::Migration[5.2]
  def change
    create_table :quests do |t|
      t.string :company_name
      t.string :uuid
      t.text :title
      t.text :description
      # 報酬
      t.text :gift # 実労働時間✖️1000
      t.text :gift_detail # 交通費あり
      # 期間
      t.text :dead_line # 2019年7月12日 ~  2019年7月18日
      t.text :dead_line_detail #上記の日程の中で最低5日
      t.timestamps
    end
  end
end