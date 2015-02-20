class Product < ActiveRecord::Base
  has_many  :line_items 
  has_many :orders, :through => :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true, :length => {:minimum => 10, :message => 'must be at least ten characters long.' }
  validates :image_url, :format => {
#            :with => %r{\.(gif|jpg|png)\z/i},
            :with => %r{[.](GIF|gif|JPE?G|jpe?g|png|PNG)\z},
            :message => 'must be a URL for GIF, JPG or PNG image.'
            }
  # default_scope :order  => 'title' 
  scope :default, lambda { order("products.title ASC")}
  scope :sorted, lambda { order("products.title ASC")}
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
             
end
