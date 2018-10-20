class Book < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :author
  has_many :chapters

  mount_uploader :image, BookImageUploader
end
