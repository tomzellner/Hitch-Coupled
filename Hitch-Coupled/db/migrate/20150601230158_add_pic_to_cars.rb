class AddPicToCars < ActiveRecord::Migration
  def change
    add_column :cars, :car_pic, :string
  end
end
