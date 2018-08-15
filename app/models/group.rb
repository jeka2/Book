class Group < ApplicationRecord
  belongs_to :book, optional: true
  has_many :memberships
  has_many :users, through: :memberships
  has_many :messages


end
