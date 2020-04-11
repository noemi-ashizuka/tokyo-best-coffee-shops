class AddCoordinatesToCoffeeShop < ActiveRecord::Migration[6.0]
  def change
    add_column :coffee_shops, :latitude, :float
    add_column :coffee_shops, :longitude, :float
  end
end
