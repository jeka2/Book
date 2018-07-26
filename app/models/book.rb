class Book < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :author
  has_many :groups
  has_many :book_groups
  has_many :user_books
  has_many :users, :through => :user_books
  has_many :groups, :through => :book_groups
end
