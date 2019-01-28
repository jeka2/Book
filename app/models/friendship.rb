class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friends, as: :user
end
