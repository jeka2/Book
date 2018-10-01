class Chapter < ApplicationRecord
  belongs_to :book
  has_many :groups, dependent: :delete_all
end
