class Order
  class LineItem
    attr_accessor :item, :quantity
    def initialize(item, quan)
      @item, @quantity = item,quan
    end
  end
  attr_accessor :line_items

  def initialize(order_number, cashier, customer)
    @order_number = order_number
    @cashier = cashier
    @customer = customer
  end

  #what happens when somebody adds the same thing twice?
  def add_line_item(item, quan)
    line_items << LineItem.new(item, quan)
  end

  def line_items
    @line_items ||= []
  end

end
