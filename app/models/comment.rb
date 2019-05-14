# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  photo_id   :integer
#

class Comment < ApplicationRecord
  # def author
  #   return User.where({ :id => self.author_id }).at(0)
  # end

  belongs_to(:author, { :class_name => "User" })

  # def photo
  #   return Photo.where({ :id => self.photo_id }).at(0)
  # end

  # belongs_to(:photo, { :class_name => "Photo" })

  belongs_to(:photo)
end
