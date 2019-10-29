class CustomersView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.name} - #{customer.address}"
    end
  end

  def ask_for(something)
    puts "#{something}?"
    gets.chomp
  end
end
