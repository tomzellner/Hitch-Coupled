class User < ActiveRecord::Base

    validates_presence_of :first_name, :last_name, :birthdate, :profile_pic

    before_save :tileize_info
    before_create :tileize_info

    before_save :default_photo
    before_create :default_photo

    def tileize_info
      self.first_name = self.first_name.titleize
      self.last_name = self.last_name.titleize
    end

    def default_photo
      if !self.profile_pic
        self.profile_pic = 'http://www.topnotchentertainment.in/images/artist/default.jpg'
      end
    end





  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :cars

        has_many :driver_trips, foreign_key: :driver_id, class_name: 'Trip'

        has_many :passenger_trips, through: :rider_relationships, source: :trip
        has_many :rider_relationships, foreign_key: 'passenger_id'




        has_many :raters, through: :rater_ratings, source: :rater
        has_many :rater_ratings, foreign_key: :rater_id, class_name: 'Rating'

        has_many :rateds, through: :rated_ratings, source: :rated
        has_many :rated_ratings, foreign_key: :rated_id, class_name: 'Rating'


        has_many :driver_conversations, foreign_key: :driver_id, class_name: "Conversation"
        has_many :passenger_conversations, foreign_key: :passenger_id, class_name: "Conversation"


end


#User.create!({:email => "guy@gmail.com",  :password => "12345678", :password_confirmation => "12345678" })