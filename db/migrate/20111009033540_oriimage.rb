class Oriimage < ActiveRecord::Migration
  def self.up
    add_column :photos, :contente_type, :string,
    :default => "image/jpg"
    execute 'ALTER TABLE photos ADD COLUMN realsnap LONGBLOB'
  end

  def self.down
     remove_column :photos, :contente_type, :realsnap
  end
end
