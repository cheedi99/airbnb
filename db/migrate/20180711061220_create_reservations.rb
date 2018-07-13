class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
    	t.references :user, foreign_key: true
    	t.references :listing, foreign_key: true
    	t.date :start_date
    	t.date :end_date
    	t.integer :total_price
    	t.integer :number_of_days


      t.timestamps
    end
  end
end
