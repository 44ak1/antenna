class CreateArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :archives do |t|
      t.date :ymd
      t.integer :hour
      t.string :url, limit: 256
      t.string :site_name, limit: 256
      t.string :title, limit: 256
      t.string :description, limit: 256
      t.string :thumbnail, limit: 256
      t.string :tag, limit: 512
      t.string :category_code, limit: 32
      t.integer :pv, default: 0, null: false
      t.boolean :is_adult, default: false
      t.boolean :is_active, default: true
      t.integer :site_id, null: false
      t.timestamps
    end
    add_index :archives, :site_id
  end
end
