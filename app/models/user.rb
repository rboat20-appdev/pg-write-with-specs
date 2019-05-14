# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  comments_count :integer
#  likes_count    :integer
#  private        :boolean
#  username       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ApplicationRecord
  # def own_photos
  #   return Photo.where({ :owner_id => self.id })
  # end

  has_many(:own_photos, { :class_name => "Photo", :foreign_key => "owner_id" })

  # def likes
  #   return Like.where({ :fan_id => self.id })
  # end

  has_many(:likes, { :class_name => "Like", :foreign_key => "fan_id" })

  # def liked_photos
  #   return Photo.where({ :id => self.likes.pluck(:photo_id) }).distinct
  # end

  has_many(:liked_photos, -> { distinct }, { :through => :likes, :source => :photo })

  # def sent_follow_requests
  #   return FollowRequest.where({ :sender_id => self.id })
  # end

  has_many(:sent_follow_requests, { :class_name => "FollowRequest", :foreign_key => "sender_id" })

  # def accepted_sent_follow_requests
  #   return self.sent_follow_requests.where({ :status => "accepted" })
  # end

  has_many(:accepted_sent_follow_requests, -> { where({ :status => "accepted" }) }, { :class_name => "FollowRequest", :foreign_key => "sender_id" })

  # def received_follow_requests
  #   return FollowRequest.where({ :recipient_id => self.id })
  # end

  has_many(:received_follow_requests, { :class_name => "FollowRequest", :foreign_key => "recipient_id" })

  # def accepted_received_follow_requests
  #   return self.received_follow_requests.where({ :status => "accepted" })
  # end

  has_many(:accepted_received_follow_requests, -> { where({ :status => "accepted" }) }, { :class_name => "FollowRequest", :foreign_key => "recipient_id" })

  # def followers
  #   return User.where({ :id => self.accepted_received_follow_requests.pluck(:sender_id) })
  # end

  has_many(:followers, { :through => :accepted_received_follow_requests, :source => :sender })

  # def following
  #   return User.where({ :id => self.accepted_sent_follow_requests.pluck(:recipient_id) })
  # end

  has_many(:following, { :through => :accepted_sent_follow_requests, :source => :recipient })

  # def feed
  #   return Photo.where({ :owner_id => self.following.pluck(:id) })
  # end

  has_many(:feed, { :through => :following, :source => :own_photos })

  # def discover
  #   leader_likes = Like.where({ :fan_id => self.following.pluck(:id) })
  #
  #   return Photo.where({ :id => leader_likes.pluck(:photo_id) }).distinct
  # end

  has_many(:discover, -> { distinct }, { :through => :following, :source => :liked_photos })
end
