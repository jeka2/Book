class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :memberships
  has_many :collections
  has_many :groups, through: :memberships
  has_many :books, through: :collections
  has_many :messages
  
  validates :first_name, presence: true

  mount_uploader :avatar, AvatarUploader

  NAME_REGEX = /\w+/


end
