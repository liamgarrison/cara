class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.references :owner, index: true, foreign_key: { to_table: :users }
      t.string :name
      t.integer :berths
      t.string :address
      t.integer :price_per_night
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
