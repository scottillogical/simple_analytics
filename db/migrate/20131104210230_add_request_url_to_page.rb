class AddRequestUrlToPage < ActiveRecord::Migration
  def change
    add_column(:events, :pixel_url, :text)
  end
end
