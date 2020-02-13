class Game < ActiveRecord::Base
  has_many :profiles
  has_many :players, through: :profiles 

end
