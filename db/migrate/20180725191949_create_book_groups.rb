class CreateBookGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :book_groups do |t|
      t.belongs_to :book, foreign_key: true
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
