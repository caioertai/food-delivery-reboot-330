require "csv"

class CustomerRepository
  def initialize(csv_path)
    @customers = []
    @csv_path  = csv_path

    load_csv
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def add(customer)
    @customers << customer
    customer.id = @next_id
    @next_id += 1
    update_csv
  end

  def all
    @customers
  end

  private

  def update_csv
    CSV.open(@csv_path, "wb") do |csv_file|
      csv_file << %w[id name address]
      @customers.each do |customer|
        csv_file << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |customer_attrs|
      customer_attrs[:id]    = customer_attrs[:id].to_i
      @customers << Customer.new(customer_attrs)
    end
  end
end
