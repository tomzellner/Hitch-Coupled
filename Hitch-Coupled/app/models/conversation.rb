class Conversation < ActiveRecord::Base
  belongs_to :driver, foreign_key: "driver_id", class_name: "User"
  belongs_to :passenger, foreign_key: "passenger_id", class_name: "User"
end
