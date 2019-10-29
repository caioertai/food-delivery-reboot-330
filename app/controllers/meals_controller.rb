require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # 1. Ask the meals from the repository
    meals = @meal_repository.all
    # 2. Ask the view to display
    @meals_view.display(meals)
  end

  def create
    # Ask the view for the meal name
    name = @meals_view.ask_for("name")
    # Ask the view for the meal price
    price = @meals_view.ask_for("price").to_i
    # Initialize the meal
    meal = Meal.new(name: name, price: price)
    # Add the meal to the repo
    @meal_repository.add(meal)
  end
end