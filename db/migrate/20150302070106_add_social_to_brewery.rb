class AddSocialToBrewery < ActiveRecord::Migration
  def change
    add_column :breweries, :twitter, :string
    add_column :breweries, :instagram, :string
    add_column :breweries, :facebook, :string
    add_column :breweries, :website, :string
  end
end
