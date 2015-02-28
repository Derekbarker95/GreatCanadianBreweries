class CreateNearbybreweries < ActiveRecord::Migration
  def change
    create_table :nearbybreweries do |t|
      t.string :search

      t.timestamps null: false
    end
  end
end
