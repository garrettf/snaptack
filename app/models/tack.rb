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
#

class Tack < ActiveRecord::Base
  #attr_accessible :name, :description, :top, :left

  has_many :photos, dependent: :destroy
  belongs_to :board

  validates :board, presence: true,
                    associated: true
  validates :top,
    presence: true,
    numericality: { 
      greater_than_or_equal_to: 0,
      less_than: ->(tack) do 
        (!tack.board.blank? && tack.board.height?) ? tack.board.height : 0
      end
    }
  validates :left,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than: ->(tack) do 
        (!tack.board.blank? && tack.board.width?) ? tack.board.width : 0 
      end
    }
end
