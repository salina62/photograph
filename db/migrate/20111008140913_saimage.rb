class Saimage < ActiveRecord::Migration
  def self.up
    add_column :photos, :name, :content_type, :string,
    :default => "image.jpg"
    execute 'ALTER TABLE photos ADD COLUMN snap LONGBLOB'
  end
 def self.down
   remove_column :photos, :name, :content_type, :snap
   
 end
end
