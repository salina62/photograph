class Photo < ActiveRecord::Base
  validates :Title, :Description, :Location, :Date_and_time, :Photographer_name,
    :image_url, :single_price, :outright_price, :presence => true
end
