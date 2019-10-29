require_relative "base_repository"
require "csv"

class CustomerRepository < BaseRepository
  private

  def update_csv
    CSV.open(@csv_path, "wb") do |csv_file|
      csv_file << %w[id name address]
      @elements.each do |customer|
        csv_file << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |customer_attrs|
      customer_attrs[:id]    = customer_attrs[:id].to_i
      @elements << Customer.new(customer_attrs)
    end
  end
end
