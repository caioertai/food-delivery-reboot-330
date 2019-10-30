class Order
  attr_accessor :id
  attr_reader :customer, :meal, :employee

  def initialize(attrs = {})
    # attrs => { id: 1, delivered: true, meal_id: 1, employee_id: 2, customer_id: 1 }
    # attrs => { id: 1, delivered: true, meal: Meal.new, employee: Employee.new, customer: Customer.new }
    @id        = attrs[:id] # Integer
    @customer  = attrs[:customer]  # Customer
    @meal      = attrs[:meal]      # Meal
    @employee  = attrs[:employee]  # Employee
    @delivered = attrs[:delivered] || false # boolean
  end

  def deliver!
    @delivered = true
  end

  def delivered?
    @delivered
  end

  def to_a
    [id, meal.id, customer.id, employee.id, delivered?]
  end
  
  def headers
    %w[id meal_id customer_id employee_id delivered]
  end
end
