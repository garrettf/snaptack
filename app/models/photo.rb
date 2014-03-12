class Photo < ActiveRecord::Base
  #attr_accessible :title, :description, :number, :image

  has_attached_file :image,
                    :styles => { :medium => "200x200>" },
                    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension",
                    :url => "/assets/photos/:id/:style/:basename.:extension",
                    :default_url => "/images/:style/missing.png"
  belongs_to :tack

  validates_presence_of :tack
  validates_associated :tack
  validates_attachment_content_type :image, :content_type => /\Aimage/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]
end
