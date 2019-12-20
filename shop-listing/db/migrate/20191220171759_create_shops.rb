class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :distance
      t.string :shop_image
      t.integer :user_id

      t.timestamps
    end
  end
end
