class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :image
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :listings, :user_id
  end
end
