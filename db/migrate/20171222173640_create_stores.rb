class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :category
      t.text :description
      t.string :address
      t.integer :postcode
      t.string :opening_hours
      t.string :crypto
      t.string :contact
      t.string :website

      t.timestamps
    end
  end
end
