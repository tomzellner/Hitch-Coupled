class CreateRiderRelationships < ActiveRecord::Migration
  def change
    create_table :rider_relationships do |t|

      t.timestamps null: false
    end
  end
end
