class CreateBanStorages < ActiveRecord::Migration[5.1]
  def change
    create_table :ban_storages do |t|
      t.references :user, foreign_key: true
      t.text :group_hash

      t.timestamps
    end
  end
end
