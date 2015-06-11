class AddEndToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :ended, :boolean, :default => false
  end
end
