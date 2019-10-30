# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller     = meals_controller
    @customers_controller = customers_controller
    @sessions_controller  = sessions_controller
    @current_employee     = nil
    @running              = true
  end

  def run
    while @current_employee.nil?
      @current_employee = @sessions_controller.login
    end

    while @running
      if @current_employee.manager?
        puts "Welcome Manager #{@current_employee.username}"
        display_manager_menu
        user_action = ask_for_action
        manager_dispatch(user_action)
      else
        puts "Welcome Delivery Guy #{@current_employee.username}"
        display_delivery_guy_menu
        user_action = ask_for_action
        delivery_guy_dispatch(user_action)
      end
    end
  end

  def display_delivery_guy_menu
    puts "1. My undelivered orders"
    puts "2. Mark an order as delivered"
    puts "0. Exit"
  end

  def delivery_guy_dispatch(action)
    case action
    when 1 then puts "TODO: show undelivered"
    when 2 then puts "TODO: mark delivered"
    when 0 then @running = false
    end
  end

  def display_manager_menu
    puts "1. List Meals"
    puts "2. Add a Meal"
    puts "3. List Customers"
    puts "4. Add customer"
    puts "0. Exit"
  end

  def ask_for_action
    print "> "
    user_action = gets.chomp.to_i
    print `clear`
    user_action
  end

  def manager_dispatch(user_action)
    case user_action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then @running = false
    end      
  end
end
