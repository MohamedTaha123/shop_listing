class ChangeDistanceToBeFloatInShops < ActiveRecord::Migration[6.0]
  def change
    change_column :shops, :distance, :float
  end
end
