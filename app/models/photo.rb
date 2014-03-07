class Photo < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => { :medium => "100x100>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  belongs_to :tack
end
