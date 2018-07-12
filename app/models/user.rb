class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :books

  mount_uploader :avatar, AvatarUploader


end
