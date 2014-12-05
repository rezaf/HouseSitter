class AddDateFieldsToListing < ActiveRecord::Migration
  def change
    add_column :listings, :start_date, :date
    add_column :listings, :end_date, :date
  end
end
