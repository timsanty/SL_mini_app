class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.text :name
      t.integer :venue_id
      t.integer :user_id

      t.timestamps
    end
  end
end
