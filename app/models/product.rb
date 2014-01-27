class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_not_referenced_any_line_item
  attr_accessible :description, :image_url, :price, :title

  private
  def ensure_not_referenced_any_line_item
    if line_items.empty?
      p "empty"
      return true
    else
      errors.add(:base, '品名がそんざいします')
      return false
    end
  end

end
