class Order
  class LineItem
    attr_accessor :item, :quantity
    def initialize(item,price, quan)
      @item, @price, @quantity = item,price,quan
    end

    def name
      @item.item_name
    end

    def price
      @price
    end
  end
  attr_accessor :line_items, :order_number, :cashier, :customer

  def initialize(order_number, cashier, customer)
    @order_number = order_number
    @cashier = cashier
    @customer = customer
  end

  #what happens when somebody adds the same thing twice?
  def add_line_item(item, price, quan = 1)
    line_items << LineItem.new(item, price, quan)
  end

  def line_items
    @line_items ||= []
  end

end
