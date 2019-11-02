class AddDetailsToEventCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :event_customers, :student_id, :integer
    add_column :event_customers, :check, :boolean
  end
end
