class Inventory
  def self.clear!
  end

  def self.stock_item(item, quantity, price)
    inventory[item.sku] ||= 0
    inventory[item.sku] += quantity
  end

  def self.in_stock?(item)
    inventory[item.sku] && inventory[item.sku] > 0
  end

  private
  def self.inventory
    @inventory ||= Hash.new
  end

end
