class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :reviewed_images, :through => :reviews, :source => :images


  has_many :active_relationships,  class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

end
