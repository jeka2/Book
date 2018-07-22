class Group < ApplicationRecord
  belongs_to :book, optional: true
  has_many :group_users
  has_many :users, :through => :group_users
end
