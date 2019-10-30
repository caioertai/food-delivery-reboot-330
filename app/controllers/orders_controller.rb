require_relative "../views/orders_view"

class OrdersController
  def initialize(order_repository, meal_repository, employee_repository, customer_repository)
    @order_repository    = order_repository
    @meal_repository     = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders_view = OrdersView.new
  end

  def list_undelivered_orders
    # Ask the orders repo for the undelivered orders
    orders = @order_repository.undelivered_orders
    # ask the view to display them
    @orders_view.display(orders)
  end

  def add
    # Ask for the meals repo for all
    meals = @meal_repository.all
    # Ask view to display meals
    meal_id = @orders_view.display_meals(meals)
    # Ask for this meal in the meal repo
    meal = @meal_repository.find(meal_id)

    # Ask for the customers repo for all
    customers = @customer_repository.all
    # Ask view to display customers
    customer_id = @orders_view.display_customers(customers)
    # Ask for this customer in the customer repo
    customer = @customer_repository.find(customer_id)
    p customer

    # Ask for the employees(delivery_guy) repo for all
    delivery_guys = @employee_repository.delivery_guys
    # Ask view to display employees
    employee_id = @orders_view.display_employees(delivery_guys)
    # Ask for this employee in the employee repo
    employee = @employee_repository.find(employee_id)

    # Build the order
    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )

    # Add the order to the orders repo
    @order_repository.add(order)
  end
end
