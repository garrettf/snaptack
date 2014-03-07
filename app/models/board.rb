class Board < ActiveRecord::Base
  has_many :tacks
  has_attached_file :image,
                    :styles => { :medium => "100x100>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  belongs_to :user
end
