class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.string :payment_type
      t.string :driver_name
      t.string :user_name
      t.references :user, null: false, foreign_key: true
      t.references :cab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
