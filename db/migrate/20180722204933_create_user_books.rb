class CreateUserBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_books do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :subscribed, default: false

      t.timestamps
    end
  end
end
