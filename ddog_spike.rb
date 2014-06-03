$: << "./lib"
require 'ddog'
require_relative './support'
# As a manager, I want the first account created to be my admin account
# Note: within the system, manager is a defined role. 
#    you can't be a manager without having an account.
#    This is also an application-level concern, not a domain level
#
verify('First account created is admin') do
  begin
    Application.new(Authenticator).init()
    user = Authenticator.sign_in("admin", "password")
    user.admin?
  rescue  => e
    e.message
  end
end


# As a manager, I want to sign in
verify("manager can sign in") do
  bob = Account.new(login: 'bob', role: Role.Manager)
  Authenticator.register bob, 'password'
  begin
    current_user = Authenticator.sign_in("bob", "password")
  rescue AuthenticationError => e
  end
  bob.manager?
end

# As a manager, I want to create items for order
verify("manager can add items to inventory") do
  alice = manager
  catfood = Item.new(123, "Cat Food", Category.Pets)
  RequireManager(alice) do
    #item, units in stock
    Inventory.stock_item(catfood, 1, price(100))
  end

  Inventory.in_stock?(catfood)
end

#assumption, missing requirement
verify "employee cannot add inventory" do
  bob = employee
  catfood = Item.new(123, "Cat Food", Category.Pets)
  begin
  RequireManager(bob) do
    Inventory.stock_item(catfood, 1, price(100))
  end
  rescue => e
    true
  end
end

def dogfood
  Item.new(1, 'Dog Food', Category.Pets)
end

def setup_orders(cashier, number_of_orders = 1)
  Inventory.stock_item(dogfood, 100, price(499))
  number_of_orders.times do |i| 
    cmd = PlaceOrder.new(
       OrderBook.next_order,
       cashier,
       Customer.new(name: "Charlie ##{i}"), 
       dogfood,
       rand(10)
    )
    cmd.run

  end
end

# As a manager, I want to see all orders
verify "manager can see all orders" do
  alice, bob = manager, employee
  Inventory.stock_item(dogfood, 100, price(499))
  setup_orders(bob, 10)

  viewed = false
  RequireManager(alice) do
    #puts is proxy for viewing orders
    OrderBook.orders.each{|o| o.items.each{|i| STDOUT.puts "#{i.name} (#{i.quantity}), #{i.quantity * i.price}"}}
    viewed = OrderBook.orders.count
  end
  viewed == 10
end

# As a manager, I want to see all orders created by a given employee.
verify "manager can see orders created by employee" do
  alice, bob, dorothy = manager('alice'), employee("bob"), employee("dorothy")
  bob_orders = setup_orders(bob, 2)
  dorothy_orders = setup_orders(dorothy, 3)

  orders = RequireManager(alice) do
    OrderBook.receipts_for(bob)
  end

  #ordinarily would write a matcher around something like this for
  #clarity
  !(orders.detect{|o| dorothy_orders.include?(o)})
end
#
# As a manager, I want to create employee accounts
verify "manager can create accounts" do
  alice = manager
  RequireManager(alice) do
    ernest = Account.new(login: 'ernest', role: Role.employee)
    Authenticator.register(ernest, 'camp')
  end
  begin
    Authenticator.sign_in("ernest","camp")
  rescue AuthenticationError => e
    return false
  end
  true
end
# As an employee, I want to sign into Double Dog PoS

verify("employee can sign in") do
  bob = Account.new(login: 'bob', role: Role.Employee)
  Authenticator.register
  begin
    Authenticator.sign_in("bob", "password")
    true
  rescue AuthenticationError => e
    false
  end
end
# As an employee, I want to create orders
# - Each order will have at least one item

