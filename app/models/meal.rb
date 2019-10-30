class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attrs = {})
    @id    = attrs[:id]
    @name  = attrs[:name]
    @price = attrs[:price]
  end

  def to_a
    # [self.id, self.name, self.price]
    [id, name, price]
  end
  
  def headers
    %w[id name price]
  end
end
