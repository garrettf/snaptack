# == Schema Information
#
# Table name: boards
#
#  id                 :integer          not null, primary key
#  name               :string(256)
#  description        :text
#  width              :integer
#  height             :integer
#  user_id            :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  demo               :boolean          default(FALSE)
#

class Board < ActiveRecord::Base
  # attr_accessible :name, :description, :image, :width, :height
  has_many :tacks, :dependent => :destroy
  has_attached_file :image,
                    styles: { medium: "100x100>", thumb: "100x100>" },
                    path: ":rails_root/public/assets/boards/:id/:style/:basename.:extension",
                    url: "/assets/boards/:id/:style/:basename.:extension",
                    default_url: "/images/:style/missing.png"
  belongs_to :user

  before_validation :extract_dimensions

  #validates_presence_of :user
  #validates_associated :user

  validates :name, presence: true, length: { maximum: 256 }
  validates :width,  presence: true,
                     numericality: { greater_than: 0 }
  validates :height, presence: true,
                     numericality: { greater_than: 0 }
  validates_attachment :image, presence: true,
                               content_type: { content_type: /\Aimage/ },
                               file_name: { matches: [/png\Z/, /jpe?g\Z/] },
                               size: { in: 0..15.megabytes }

  def image?
    image_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|png|x-png)$}
  end

  private

  # Retrieves dimensions for image assets
  # @note Do this after resize operations to account for auto-orientation.
  def extract_dimensions
    return unless image?
    tempfile = image.queued_for_write[:original]
    unless tempfile.nil?
      geometry = Paperclip::Geometry.from_file(tempfile)
      self.width = geometry.width.to_i 
      self.height = geometry.height.to_i
    end
  end
end
