class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attrs = {})
    @id       = attrs[:id]
    @username = attrs[:username]
    @password = attrs[:password]
    @role     = attrs[:role]
  end

  def delivery_guy?
    @role == "delivery_guy"
  end

  def manager?
    @role == "manager"
  end

  def to_a
    [id, username, password, role]
  end

  def headers
    %w[id username password role]
  end
end
