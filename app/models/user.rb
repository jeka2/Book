class User < ApplicationRecord
  require 'carrierwave/orm/activerecord'

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :memberships
  has_many :collections
  has_many :groups, through: :memberships
  has_many :books, through: :collections
  has_many :messages
  has_many :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

  has_many :active_friends, -> { where(friendships: { accepted: true }) }, through: :friendships, source: :friend
  has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user

  validates :first_name, presence: true

  mount_uploader :avatar, AvatarUploader

  enum status:  [:standard, :moderator, :admin]
  enum private: [:publ, :priv]

  NAME_REGEX = /\w+/

  def friends
    active_friends | received_friends
  end 

  def pending
    pending_friends | requested_friendships
  end


end
