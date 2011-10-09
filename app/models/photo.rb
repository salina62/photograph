class Photo < ActiveRecord::Base
  default_scope :order => 'Title'
  has_many :line_items
  has_many :orders, :through => :line_items

  
  attr_reader :sample_image
  before_destroy :ensure_not_referenced_by_any_line_item
   
  
  validates :Title, :Description, :Location, :Date_and_time, :Photographer_name,
   :single_price, :outright_price, :presence => true
  validates :Title, :uniqueness => true
  validates :single_price, :outright_price, :numericality =>
    {:greater_than_or_equal_to => 0.01}
 
  
  def sample_image=(photo_field)
    #self.name =~ /\.(jpeg|jpg|gif|png)$/i
    self.content_type = photo_field.content_type.to_s.chomp
     self.snap = photo_field.read
   end

  def original_image=(photo_field)
    #self.name =~ /\.(jpeg|jpg|gif|png)$/i
    self.content_type = photo_field.content_type.to_s.chomp
     self.realsnap = photo_field.read
   end
   

  
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
   def self.search(search)
    if search
     find(:all, :conditions => ['Title LIKE ? or Photographer_name LIKE ?', "%#{search}%", "%#{search}%"])
    else
     find(:all)
    end
  end
end
