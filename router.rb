# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome"
    while @running
      puts "1. List Meals"
      puts "2. Add a Meal"
      puts "3. List Customers"
      puts "4. Add customer"
      puts "0. Exit"
      print "> "
      user_action = gets.chomp.to_i
      print `clear`
      case user_action
      when 1 then @meals_controller.list
      when 2 then @meals_controller.create
      when 3 then @customers_controller.list
      when 4 then @customers_controller.create
      when 0 then @running = false
      end      
    end
  end
end
