class Role < Struct.new(:label, :id)
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
