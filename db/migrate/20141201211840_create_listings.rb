class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :image
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    add_index :listings, :user_id
    add_index :listings, :latitude
    add_index :listings, :longitude
  end
end
