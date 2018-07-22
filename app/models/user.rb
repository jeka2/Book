class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :books
  has_many :group_users
  has_many :groups, :through => :group_users
  has_many :messages
  
  validates :first_name, presence: true

  mount_uploader :avatar, AvatarUploader

  NAME_REGEX = /\w+/


end
