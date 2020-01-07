class AddEventCustomerIdToEventApplyTag < ActiveRecord::Migration[5.2]
  def change
    add_reference :event_apply_tags, :event_customer, foreign_key: true
  end
end
