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
    @user_orders||=Hash.new
    @user_orders[user.login]
  end

  def self.record(order)

  end

  private
  def self.orders
    @orders ||= Hash.new
  end
end
