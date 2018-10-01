class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.belongs_to :book, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
