class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :image, null: false
      t.string :description, null: false
      t.integer :unit_price, null: false
      t.integer :quantity, null: false
      t.integer :total, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
