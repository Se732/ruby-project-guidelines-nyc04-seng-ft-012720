class Player < ActiveRecord::Base 
    has_many :profiles 
    # player1.profiles
    has_many :games, through: :profiles
end
