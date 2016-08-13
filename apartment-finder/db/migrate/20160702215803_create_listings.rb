class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :street_address_1
      t.string :street_address_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country

      t.timestamps null: false
    end
  end
end
