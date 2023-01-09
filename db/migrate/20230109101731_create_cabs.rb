class CreateCabs < ActiveRecord::Migration[7.0]
  def change
    create_table :cabs do |t|
      t.string :registration
      t.string :category
      t.string :driver_name

      t.timestamps
    end
  end
end
