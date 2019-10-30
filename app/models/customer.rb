class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attrs ={})
    @id      = attrs[:id]
    @name    = attrs[:name]
    @address = attrs[:address]
  end

  def to_a
    # [self.id, self.name, self.address]
    [id, name, address]
  end

  def headers
    %w[id name address]
  end
end
