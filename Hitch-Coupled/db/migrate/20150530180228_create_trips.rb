class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|

    	t.integer :seats
      t.string :make
      t.string :model
      t.string :type_of
      t.integer :year
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
