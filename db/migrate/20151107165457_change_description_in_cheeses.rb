class ChangeDescriptionInCheeses < ActiveRecord::Migration
  def up 
    change_column :cheeses, :description, :text
  end

  def down
    change_column :cheeses, :description, :string
  end
end
