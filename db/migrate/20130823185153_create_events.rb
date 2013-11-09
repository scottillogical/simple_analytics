class CreateEvents < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
    create_table :events do |t|
      t.uuid :network_user_id
      t.uuid :domain_user_id
      t.text :url 
      t.string :app_id
      t.string :ip_address
      t.string :user_id
      t.text :user_agent
      t.string :event_type
      t.string :event_desc
      t.string :referrer
      t.text :utm_source
      t.string :utm_medium
      t.string :utm_campaign
      t.string :utm_term
      t.string :utm_content
      t.string :page_urlhost
      t.text :page_path
      t.text :page_query
      t.timestamps
    end
  end
end
