class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :driver_id
      t.integer :passenger_id
      t.integer :trip_id
      t.timestamps null: false
    end
  end
end
