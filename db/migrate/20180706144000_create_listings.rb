class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :country
      t.string :city
      t.string :area
      t.string :street
      t.string :name
      t.string :property_type
      t.integer :number_of_guest
      t.integer :number_of_rooms
      t.integer :number_of_bathrooms
      t.integer :price

      t.timestamps
    end
  end
end