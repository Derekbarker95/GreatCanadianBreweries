class AddProvinceToBrewery < ActiveRecord::Migration
  def change
    add_column :breweries, :province, :string
  end
end
