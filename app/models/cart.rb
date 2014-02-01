class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  # 追加しようとする商品が品目に含まれているかどうかを確認して
  # 含まれていばければ数量を増やし、含まれていなければLineitemを作成する
  def add_product(product_id)
    logger.debug "@@@ add_product:"
    logger.debug(product_id.inspect)

    current_item = line_items.find_by_product_id(product_id)
    logger.debug current_item.inspect

    if current_item
      current_item.quantity += 1
    else 
      current_item = line_items.build(product_id: product_id)
    end 
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
