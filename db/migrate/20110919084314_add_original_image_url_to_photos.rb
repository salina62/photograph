class AddOriginalImageUrlToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :original_image_url, :string
  end

  def self.down
    remove_column :photos, :original_image_url
  end
end
