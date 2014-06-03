require 'authentication_error'
class Authenticator
  def self.clear!
    registrations.clear
    accounts.clear
  end

  def self.admin_exists?
    accounts.detect{|k, v| true if v.admin?}
  end

  #my totally secure login method
  def self.sign_in(login, password)
    raise AuthenticationError.new unless registrations[login] == password
    return accounts[login]
  end

  def self.register(user, passwd)
    registrations[user.login.to_s] = passwd
    accounts[user.login.to_s] = user
  end

  private
  def self.registrations
    @registrations ||= Hash.new
  end

  def self.accounts
    @accounts||= Hash.new
  end

end
