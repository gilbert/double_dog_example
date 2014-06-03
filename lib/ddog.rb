require 'application'
require 'authentication_error'
require 'authenticator'
require 'inventory'
require 'order_book'
def verify(subject, fail_message = "was expected to be true", &test)
  reset!
  if yield
    STDOUT.puts "#{subject} passed"
  else
    STDERR.puts "#{subject} #{fail_message}"
  end
end
