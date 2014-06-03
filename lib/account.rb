

class Account 
  attr_accessor :login, :password, :role

  def initialize(opts)
    @login = opts[:login]
    @password = opts[:password]
    @role = opts[:role]
  end

  def admin?; role == Role.Admin; end
  def manager?; role == Role.Manager; end
  def employee?; role == Role.Employee; end

end
