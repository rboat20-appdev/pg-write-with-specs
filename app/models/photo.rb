# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
  # def owner
  #   return User.where({ :id => self.owner_id }).at(0)
  # end

  belongs_to(:owner, { :class_name => "User", :foreign_key => "owner_id" })

  # def comments
  #   return Comment.where({ :owner_id => self.id })
  # end

  has_many(:comments)

  # def likes
  #   return Like.where({ :fan_id => self.id })
  # end

  has_many(:likes)

  # def fans
  #   return User.where({ :id => self.likes.pluck(:fan_id) })
  # end

  has_many(:fans, { :through => :likes, :source => :fan })
end
