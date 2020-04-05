class CreateCoffeeShops < ActiveRecord::Migration[6.0]
  def change
    create_table :coffee_shops do |t|
      t.string :name
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
