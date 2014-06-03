class Application
  def initialize(auth_strategy)
    @auth_strategy = auth_strategy
  end

  def init
    initial_setup unless initial_setup_complete?
  end

  private
  def initial_setup_complete?
    auth.admin_exists?
  end

  def auth
    @auth_strategy
  end
end
