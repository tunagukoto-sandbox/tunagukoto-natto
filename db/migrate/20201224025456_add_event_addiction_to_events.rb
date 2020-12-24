class AddEventAddictionToEvents < ActiveRecord::Migration[5.2]
  def change
    # 企業参加用URL
    add_column :events, :url_form_to_com, :text
    # イベントの場所(ツナグオフィスなど)
    add_column :events, :event_place_title, :string
    # 社会人参加費
    add_column :events, :pay_point_by_adult, :integer
    # Topに表示しないか？
    add_column :events, :un_open, :boolean
    # 備考
    add_column :events, :free_box, :text
  end
end
