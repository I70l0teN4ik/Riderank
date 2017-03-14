class CreateRides < ActiveRecord::Migration[5.0]
  def change
    create_table :rides do |t|
      t.references :user
      t.references :taxi

      t.string  :origin
      t.string  :destination
      t.decimal :price, precision: 8, scale: 2, default: 0.0
      t.integer :distance, default: 0

      t.timestamps
    end
  end
end
