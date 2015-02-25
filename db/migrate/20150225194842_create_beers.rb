class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.references :brewery, index: true
      t.string :name
      t.string :style
      t.text :description
      t.integer :ibu
      t.decimal :abv
      t.string :color

      t.timestamps null: false
    end
    add_foreign_key :beers, :breweries
  end
end
