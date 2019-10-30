require "csv"

class BaseRepository
  def initialize(csv_path)
    @elements = []
    @csv_path = csv_path
  
    load_csv if File.exist?(@csv_path)
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def add(element)
    @elements << element
    element.id = @next_id
    @next_id += 1
    update_csv
  end

  def all
    @elements
  end

  def find(id)
    @elements.find { |element| element.id == id } 
  end

  private

  def build_element(_)
    raise Exception, "Must implement #build_element"
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |csv_file|
      csv_file << @elements.last.headers
      @elements.each do |element|
        csv_file << element.to_a
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |element_attrs|
      @elements << build_element(element_attrs)
    end
  end
end
