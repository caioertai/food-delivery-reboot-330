require_relative "base_repository"
require "csv"

class MealRepository < BaseRepository
  private

  def update_csv
    CSV.open(@csv_path, "wb") do |csv_file|
      csv_file << %w[id name price]
      @elements.each do |meal|
        csv_file << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |meal_attrs|
      meal_attrs[:id]    = meal_attrs[:id].to_i
      meal_attrs[:price] = meal_attrs[:price].to_i
      @elements << Meal.new(meal_attrs)
    end
  end
end
