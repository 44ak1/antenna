class CreateArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.string :uuid, limit: 15, null: false
      t.string :url, limit: 255
      t.string :title, limit: 255
      t.string :description, limit: 255
      t.string :real_image_url, limit: 255
      t.string :image, limit: 255
      t.string :tag, limit: 511
      t.integer :pv, default: 0, null: false
      t.timestamp :published_at, default: '0000-00-00 00:00:00'
      t.boolean :is_safety, default: true
      t.boolean :is_active, default: true
      t.integer :site_id, null: false
      t.timestamps
    end
    add_index :archives, :site_id
    add_index :archives, :uuid, :unique => true
    add_index :archives, :published_at
    add_index :archives, :is_safety
    add_index :archives, :is_active
  end
end
