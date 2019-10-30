require_relative "base_repository"
require "csv"

class CustomerRepository < BaseRepository
  private

  def build_element(customer_attrs)
    customer_attrs[:id] = customer_attrs[:id].to_i
    Customer.new(customer_attrs)
  end
end
