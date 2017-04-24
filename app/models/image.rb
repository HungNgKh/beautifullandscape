class Image < ApplicationRecord
  mount_uploader :file, ImageUploader

  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :reviewed_users, :through => :reviews, :source => :users
  has_many :image_comment, -> {order "created_at DESC"}
end
