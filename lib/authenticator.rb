class Authenticator
  def self.clear!

  end

  def self.sign_in(login, password)
    raise AuthenticationError.new unless @registrations[login] == password

  end

end
