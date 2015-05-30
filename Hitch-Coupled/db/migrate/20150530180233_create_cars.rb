class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|

    	 t.string :start_city
      t.string :start_state
      t.string :end_city
      t.string :end_state
      t.datetime :start_date
      t.datetime :end_date
      t.integer :num_passengers
      t.integer :driver_id
      t.integer :car_id

      t.timestamps null: false
    end
  end
end
