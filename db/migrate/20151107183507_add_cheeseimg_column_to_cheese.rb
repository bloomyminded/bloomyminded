class AddCheeseimgColumnToCheese < ActiveRecord::Migration
  def up
    add_attachment :cheeses, :cheeseimg
  end

  def down
    remove_attachment :cheeses, :cheeseimg
  end
end
