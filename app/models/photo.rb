class Photo < ActiveRecord::Base
  attr_accessible :title, :description, :number, :image

  has_attached_file :image,
                    :styles => { :medium => "100x100>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  belongs_to :tack

  validates_presence_of :tack
  validates_associated :tack
end
