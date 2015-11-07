class CreateCheeses < ActiveRecord::Migration
  def change
    create_table :cheeses do |t|
      t.string :name
      t.string :producer
      t.string :country
      t.string :region
      t.string :rind
      t.string :texture
      t.string :age
      t.string :description

      t.timestamps null: false
    end
  end
end
