class Group < ApplicationRecord
  belongs_to :book
  belongs_to :chapter, optional: true
  has_many :memberships
  has_many :users, through: :memberships
  has_many :messages

  validates :name, presence: :true, uniqueness: { scope: :chapter }

  NAME_REGEX = /\w+/


end
