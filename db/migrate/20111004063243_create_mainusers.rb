class CreateMainusers < ActiveRecord::Migration
  def self.up
    create_table :mainusers do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :mainusers
  end
end
