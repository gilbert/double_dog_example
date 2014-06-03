require 'authentication_error'
class Authenticator
  def self.clear!

  end

  #my totally secure login method
  def self.sign_in(login, password)
    raise AuthenticationError.new unless registrations[login] == password
  end

  private
  def self.registrations
    @registrations ||= Hash.new
  end

end
