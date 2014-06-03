class OrderBook
  def self.clear!
    orders.clear
  end
  #not threadsafe!
  def self.next_order
    @osq ||= 0
    @osq += 1
  end

  def self.receipts_for(user)
    user_orders[user.login]
  end


  def self.record(order)
    orders[order.order_number] = order
    #LOD violation!!!!
    user_orders[order.cashier.login] ||= []
    user_orders[order.cashier.login] << order
  end

  def self.each(&block)
    orders.values.each(&block)
  end

  private
  def self.user_orders
    @user_orders||=Hash.new
  end
  def self.orders
    @orders ||= Hash.new
  end
end
