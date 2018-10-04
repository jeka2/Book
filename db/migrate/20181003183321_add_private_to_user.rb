class AddPrivateToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :private, :integer, default: 0
  end
end
