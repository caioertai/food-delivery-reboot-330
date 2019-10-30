require_relative "base_repository"
require "csv"

class EmployeeRepository < BaseRepository
  undef add

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  private

  def build_element(employee_attrs)
    employee_attrs[:id] = employee_attrs[:id].to_i
    Employee.new(employee_attrs)
  end
end
