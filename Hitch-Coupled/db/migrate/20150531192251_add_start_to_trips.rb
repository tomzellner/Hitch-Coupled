class AddStartToTrips < ActiveRecord::Migration
  def change
  	add_column :trips, :started, :boolean, :default => false
  end
end
