class Tack < ActiveRecord::Base
  has_many :photos
  belongs_to :board
end
