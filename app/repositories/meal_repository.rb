require_relative "base_repository"
require "csv"

class MealRepository < BaseRepository
  private

  def build_element(meal_attrs)
    meal_attrs[:id]    = meal_attrs[:id].to_i
    meal_attrs[:price] = meal_attrs[:price].to_i
    Meal.new(meal_attrs)
  end
end
