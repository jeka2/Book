class BanStorage < ApplicationRecord
  belongs_to :user
  serialize :group_hash
end
