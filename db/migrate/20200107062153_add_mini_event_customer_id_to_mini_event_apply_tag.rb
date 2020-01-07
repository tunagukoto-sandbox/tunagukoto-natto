class AddMiniEventCustomerIdToMiniEventApplyTag < ActiveRecord::Migration[5.2]
  def change
    add_reference :mini_event_apply_tags, :mini_event_customer, foreign_key: true
  end
end
