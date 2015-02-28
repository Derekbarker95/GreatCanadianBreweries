class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body
      t.references :beer, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
