class CreateEventCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_customers do |t|
    	t.string  :email
    	t.string  :name
    	t.integer :school_id
    	t.integer :event_id
    	t.string  :tel

      t.timestamps
    end
  end
end
