class AddTripIdToSearch < ActiveRecord::Migration
  def change
  	add_column :searches, :trip_id, :integer
  end
end
