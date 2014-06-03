class PlaceOrder
  attr_accessor :cashier, :customer, :item, :quantity
  def initialize order_num, cashier, customer, item, quantity=1
    @order_number, @cashier, @customer, @item, @quantity = order_num, cashier, customer, item, quantity
  end

  def valid?
    return false unless Inventory.in_stock?(item, quantity)
  end

  def run
    order = Order.new(@order_number, cashier, customer)
    #this is a dependency that should really be injected
    price = Inventory.price_for(item)
    order.add_line_item(item, price, quantity)
    #this is a dependency that should really be injected
    Inventory.remove_stock(item, quantity)
    OrderBook.record(order)
  end
end
