class Changecolumnevents < ActiveRecord::Migration
  def change

    change_column :events, :referrer, :text
  end
end
