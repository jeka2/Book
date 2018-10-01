class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :publisher
      t.datetime :publish_date
      t.string :description
      t.boolean :finished
      t.integer :current_page
      t.integer :rating, default: 0
      t.integer :rating_count, default: 0
      t.boolean :subscribed, default: false
      t.belongs_to :user, foreign_key: true
      t.belongs_to :author, foreign_key: true

      t.timestamps
    end
  end
end
