class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :img
      t.string :description
      t.references :market, null: false, foreign_key: true

      t.timestamps
    end
  end
end
