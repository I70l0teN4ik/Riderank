class CreateTaxis < ActiveRecord::Migration[5.0]
  def change
    create_table :taxis do |t|
      t.string :name

      t.timestamps
    end

    add_index :taxis, :name, unique: true
  end
end
