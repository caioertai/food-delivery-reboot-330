require "csv"

class BaseRepository
  def initialize(csv_path)
    @elements    = []
    @csv_path = csv_path
  
    load_csv
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
end
