class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :contact_name
      t.string :contact_email
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
