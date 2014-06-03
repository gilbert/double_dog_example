class Item
  attr_accessor :sku, :item_name, :category
  def initialize(sku, item_name, category)
    @sku, @item_name, @price = sku, item_name, category
  end
end
