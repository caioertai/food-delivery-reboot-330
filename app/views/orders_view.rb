class OrdersView
  def display(orders)
    orders.each do |order|
      meal_name = order.meal.name
      customer_name = order.customer.name
      customer_address = order.customer.address
      delivery_guy_name = order.employee.username
      puts "#{meal_name} for #{customer_name} at #{customer_address} (to be delivered by #{delivery_guy_name})"
    end
  end

  def display_meals(meals)
    puts "Pick a meal:"
    meals.each do |meal|
      puts "#{meal.id} #{meal.name}"
    end
    gets.chomp.to_i
  end

  def display_customers(customers)
    puts "Pick a customer:"
    customers.each do |customer|
      puts "#{customer.id} #{customer.name}"
    end
    gets.chomp.to_i
  end

  def display_employees(employees)
    puts "Pick an employee:"
    employees.each do |employee|
      puts "#{employee.id} #{employee.username}"
    end
    gets.chomp.to_i
  end
end
