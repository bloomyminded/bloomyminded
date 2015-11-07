class AddRennetToCheese < ActiveRecord::Migration
  def change
    add_column :cheeses, :rennet, :string
  end
end
