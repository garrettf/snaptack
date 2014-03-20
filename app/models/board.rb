class Board < ActiveRecord::Base
  # attr_accessible :name, :description, :image, :width, :height
  has_many :tacks, :dependent => :destroy
  has_attached_file :image,
                    :styles => { :medium => "100x100>", :thumb => "100x100>" },
                    :path => ":rails_root/public/assets/boards/:id/:style/:basename.:extension",
                    :url => "/assets/boards/:id/:style/:basename.:extension",
                    :default_url => "/images/:style/missing.png"
  belongs_to :user

  #validates_presence_of :user
  #validates_associated :user
  validates_attachment_content_type :image, :content_type => /\Aimage/
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

  def self.cleanup!(cutoff)
    Board.destroy_all(["id != 9 AND created_at < (?)", cutoff])
  end
end
