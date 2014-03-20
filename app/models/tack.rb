class Tack < ActiveRecord::Base
  #attr_accessible :name, :description, :top, :left

  has_many :photos, :dependent => :destroy
  belongs_to :board

  validates_presence_of :board
  validates_associated :board
end
