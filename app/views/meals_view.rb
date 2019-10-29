class MealsView
  def display(meals)
    # meals => array of meals
    meals.each do |meal|
      puts "#{meal.name} - R$#{meal.price}"
    end
  end

  def ask_for(something)
    puts "#{something}?"
    gets.chomp
  end
end
