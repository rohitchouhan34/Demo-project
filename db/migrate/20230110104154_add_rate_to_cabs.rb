class AddRateToCabs < ActiveRecord::Migration[7.0]
  def change
    add_column :cabs, :rate, :integer
  end
end
