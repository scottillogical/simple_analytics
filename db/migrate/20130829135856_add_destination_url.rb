class AddDestinationUrl < ActiveRecord::Migration
  def change
    add_column :events, :destination_url, :text
  end
end
