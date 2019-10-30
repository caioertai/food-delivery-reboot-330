require "pry-byebug"
require_relative "base_repository"

class OrderRepository < BaseRepository
  def initialize(csv_path, meal_repository, employee_repository, customer_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    super(csv_path)
  end

  def undelivered_orders
    # @elements.reject { |element| element.delivered? } 
    @elements.reject(&:delivered?)
  end

  private

  def build_element(order_attrs)
    order_attrs[:id]        = order_attrs[:id].to_i
    order_attrs[:meal]      = @meal_repository.find(order_attrs[:meal_id].to_i)
    order_attrs[:employee]  = @employee_repository.find(order_attrs[:employee_id].to_i)
    order_attrs[:customer]  = @customer_repository.find(order_attrs[:customer_id].to_i)
    order_attrs[:delivered] = order_attrs[:delivered] == "true"
    Order.new(order_attrs)
  end
end
