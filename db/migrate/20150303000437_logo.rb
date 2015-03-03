class Logo < ActiveRecord::Migration
  def change
    add_column :breweries, :logo, :string
  end
end
