class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("http://localhost:3000/api/v2/employees").body
  end
  def show
    id = params[:id]
    @employee = Unirest.get("http://localhost:3000/api/v2/employees/#{id}").body
  end
end
