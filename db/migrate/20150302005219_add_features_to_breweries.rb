class AddFeaturesToBreweries < ActiveRecord::Migration
  def change
    add_column :breweries, :growler, :boolean, :default => false
    add_column :breweries, :tour, :boolean, :default => false
    add_column :breweries, :tasteing, :boolean, :default => false
    add_column :breweries, :keg, :boolean, :default => false
  end
end
