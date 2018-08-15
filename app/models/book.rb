class Book < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :author
  has_many :groups
end
