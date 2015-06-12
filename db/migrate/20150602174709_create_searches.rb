class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :start_city
      t.string :start_state
      t.string :end_city
      t.string :end_state
      


      t.timestamps null: false
    end
  end
end
