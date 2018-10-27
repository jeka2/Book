class User < ApplicationRecord
  require 'carrierwave/orm/activerecord'

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_friendship
  has_many :memberships
  has_many :collections
  has_many :groups, through: :memberships
  has_many :books, through: :collections
  has_many :messages

  validates :first_name, presence: true

  mount_uploader :avatar, AvatarUploader

  enum status:  [:standard, :moderator, :admin]
  enum private: [:publ, :priv]
  enum gender:  [:male, :female, :other]

  NAME_REGEX = /\w+/

  def friends
    active_friends | received_friends
  end 

  def pending
    pending_friends | requested_friendships
  end


end
