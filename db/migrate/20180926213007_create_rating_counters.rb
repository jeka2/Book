class CreateRatingCounters < ActiveRecord::Migration[5.1]
  def change
    create_table :rating_counters do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
