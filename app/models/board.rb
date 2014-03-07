class Board < ActiveRecord::Base
  has_many :tacks
  belongs_to :user
end
