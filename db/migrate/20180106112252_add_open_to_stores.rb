class AddOpenToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :open, :boolean, default: true
  end
end
