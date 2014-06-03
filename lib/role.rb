class Role 
  attr_accessor :label, :id
  def initialize(opts)
    @label = opts[:label]
    @id = opts[:id]
  end

  def to_s
    @label
  end

  def self.Manager()
    @mgr ||= Role.new(label: 'Manager', id: 'manager')
  end

  def self.Employee()
    @emp ||= Role.new(label: "Employee", id: 'employee')
  end

  def self.Admin()
    @admin ||= Role.new(label: "Admin", id: 'admin')
  end
end
