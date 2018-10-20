class Group < ApplicationRecord
  belongs_to :chapter
  has_many :memberships
  has_many :users, through: :memberships
  has_many :messages

  validates :name, presence: :true, uniqueness: { scope: :chapter }

  NAME_REGEX = /\w+/


end
