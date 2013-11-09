class AddItemId < ActiveRecord::Migration
  def change
    add_column(:events, :item_id, :string)
  end
end
