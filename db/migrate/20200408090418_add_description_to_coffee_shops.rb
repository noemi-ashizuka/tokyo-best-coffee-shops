class AddDescriptionToCoffeeShops < ActiveRecord::Migration[6.0]
  def change
    add_column :coffee_shops, :description, :text
  end
end
