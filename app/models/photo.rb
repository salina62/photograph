class Photo < ActiveRecord::Base
  default_scope :order => 'Title'
  has_many :line_items
  has_many :line_item_for_images
  has_many :orders, :through => :line_items

  
  before_destroy :ensure_not_referenced_by_any_line_item
   before_destroy :ensure_not_referenced_by_any_line_item_for_image
  
  validates :Title, :Description, :Location, :Date_and_time, :Photographer_name,
    :image_url, :single_price, :outright_price, :presence => true
  validates :Title, :uniqueness => true
  validates :single_price, :outright_price, :numericality =>
    {:greater_than_or_equal_to => 0.01}
  validates :image_url, :format =>{
            :with => %r{\.(gif|jpg|png)$}i,
            :message => 'must be a URL for GIF, JPG or PNG image.'}
          private
          # ensure that there are no line items referencing this product
            def ensure_not_referenced_by_any_line_item
              if line_items.empty?
                 return true
              else
                 errors.add(:base, 'Line Items present')
                 return false
              end
          end

            def ensure_not_referenced_by_any_line_item_for_image
              if line_item_for_images.empty?
                 return true
              else
                 errors.add(:base, 'Line Items present')
                 return false
              end
          end

   def self.search(search)
    if search
     find(:all, :conditions => ['Title LIKE ? or photographer_name LIKE ?', "%#{search}%", "%#{search}%"])
    else
     find(:all)
    end
  end
end
