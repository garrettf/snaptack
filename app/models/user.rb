# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(256)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  #attr_accessible :name

  has_many :boards
end
