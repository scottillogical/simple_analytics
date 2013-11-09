class AddItemDesc < ActiveRecord::Migration
  def change
    add_column(:events, :item_desc, :string)
  end
end
