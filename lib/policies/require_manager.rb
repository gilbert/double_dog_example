class RequireManager
  def initialize(user)
    @user = user
  end

  def allowed?
    @user.manager?
  end

  def run(&block)
    raise "Not Allowed for #{user.login}" unless allowed?
    yield 
  end
end
def RequireManager(user, &block)
  rm = RequireManager.new(user)
  rm.run(&block)
end
