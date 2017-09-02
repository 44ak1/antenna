class CreateSites < ActiveRecord::Migration[5.1]
  def change
    create_table :sites do |t|
      t.string :site_name, null:false, limit:256
      t.string :url, null:false, limit: 256
      t.string :domain, limit: 256
      t.string :rss_url, null:false, limit: 256
      t.string :mail, limit: 256
      t.text :description
      t.integer :rate, default:1, null:false
      t.integer :rank, default:0, null:false
      t.integer :mod_interval, default:0, null:false
      t.integer :pv, default:0, null:false
      t.integer :outpv, default:0, null:false
      t.string :category_code, limit: 32
      t.timestamp :succeed_at, default: '0000-00-00 00:00:00'
      t.timestamp :errored_at, default: '0000-00-00 00:00:00'
      t.timestamp :pv_updated_at, default: '0000-00-00 00:00:00'
      t.boolean :is_stop, default:false, null:false
      t.timestamp :stoped_at, default: '0000-00-00 00:00:00'
      t.boolean :is_active, default:true, null:false

      t.timestamps
    end
  end
end
