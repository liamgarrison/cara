class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :renter, index: true, foreign_key: { to_table: :users }
      t.references :vehicle, foreign_key: true
      t.date :start_date
      t.integer :number_of_nights

      t.timestamps
    end
  end
end
