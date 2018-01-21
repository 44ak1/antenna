class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :name, null:false, limit:255
      t.string :url, null:false, limit: 255
      t.string :domain, limit: 255
      t.string :rss_url, null:false, limit: 255
      t.string :email, limit: 255
      t.text :description
      t.integer :rate, default:1, null:false
      t.integer :rank, default:0, null:false
      t.integer :modify_interval, default:0, null:false
      t.integer :in, default:0, null:false
      t.integer :out, default:0, null:false
      t.string :category_code, limit: 32
      t.boolean :is_crawlable, default:true, null:false
      t.timestamp :successed_at, default: '0000-00-00 00:00:00'
      t.timestamp :errored_at, default: '0000-00-00 00:00:00'
      t.boolean :is_recommendable, default:true, null:false
      t.timestamp :unrecommended_at, default: '0000-00-00 00:00:00'
      t.boolean :is_active, default:true, null:false

      t.timestamps
    end
    add_index :sites, :name, :unique => true
  end
end
