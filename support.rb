gem 'byebug'
require 'byebug'
def verify(subject,  expected = true, &test)
  reset!
  result = yield
  if result == expected
    STDOUT.puts "-"*30
    STDOUT.puts "#{subject} PASSED"
    STDOUT.puts "-"*30
  else
    STDERR.puts "#"*30
    STDERR.puts "#{subject} FAILED: expected #{ expected }, got: #{result}"
    STDERR.puts "#"*30
  end
end
def reset!
  Authenticator.clear!
  Inventory.clear!
  OrderBook.clear!
end
def manager(name = 'Alice', password='password')
  acct = Account.new(login: name, role: Role.Manager)
  Authenticator.register(acct, password)
  acct
end

def employee(name='Bob', password='password')
  acct= Account.new(login: name, role: Role.Employee)
  Authenticator.register(acct, password)
  acct
end
