class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
        t.integer :seats
      t.string :make
      t.string :model
      t.string :type_of
      t.integer :year
      t.integer :user_id
      t.string :car_pic



      t.timestamps null: false
    end
  end
end
