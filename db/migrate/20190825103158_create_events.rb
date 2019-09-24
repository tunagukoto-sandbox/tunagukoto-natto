class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
    	t.string	:event_name #イベント名
      t.text    :event_title
      # t.text    :event_question 
    	t.text		:event_description # イベント説明
    	t.string	:event_location #イベント場所
    	t.string	:event_cost # 参加費
      t.date    :event_time # 2019年7月12日　金曜日
      t.string  :event_time_detail # 17:45~20:45
      t.string  :event_company_name # 会社名
      t.integer :event_population #募集人数
      t.string  :event_president # 社長名
      t.string  :event_president_birth_day #誕生日
      t.string  :event_motto #座右の銘
    	t.string	:google_form # 参加フォーム
      t.integer :tag_id

      t.timestamps
    end
  end
end
