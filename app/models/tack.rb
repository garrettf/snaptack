# == Schema Information
#
# Table name: tacks
#
#  id          :integer          not null, primary key
#  name        :string(256)
#  description :text
#  top         :integer
#  left        :integer
#  board_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  demo        :boolean          default(FALSE)
#

class Tack < ActiveRecord::Base
  #attr_accessible :name, :description, :top, :left

  has_many :photos, :dependent => :destroy
  belongs_to :board

  validates_presence_of :board
  validates_associated :board
end
