class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :image
      t.string :description
      t.integer :unit_price
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end
end
