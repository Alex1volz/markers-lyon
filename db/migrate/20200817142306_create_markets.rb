class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.string :img
      t.string :name
      t.string :street
      t.string :postal_code
      t.string :city
      t.string :opening_hours
      t.string :vendors
      t.string :products
      t.string :info
      t.boolean :open_on, array: true
      t.boolean :bio
      t.boolean :night

      t.timestamps
    end
  end
end
