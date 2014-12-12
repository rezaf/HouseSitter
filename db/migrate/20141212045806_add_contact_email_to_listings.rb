class AddContactEmailToListings < ActiveRecord::Migration
  def change
    add_column :listings, :contact_email, :string
  end
end
