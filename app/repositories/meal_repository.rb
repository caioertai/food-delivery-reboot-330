require "csv"

class MealRepository
  def initialize(csv_path)
    @meals    = []
    @csv_path = csv_path
  
    load_csv
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def add(meal)
    @meals << meal
    meal.id = @next_id
    @next_id += 1
    update_csv
  end

  def all
    @meals
  end

  private

  def update_csv
    CSV.open(@csv_path, "wb") do |csv_file|
      csv_file << %w[id name price]
      @meals.each do |meal|
        csv_file << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |meal_attrs|
      meal_attrs[:id]    = meal_attrs[:id].to_i
      meal_attrs[:price] = meal_attrs[:price].to_i
      @meals << Meal.new(meal_attrs)
    end
  end
end
