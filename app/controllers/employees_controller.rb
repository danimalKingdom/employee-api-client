class EmployeesController < ApplicationController
  def show
    id = params[:id]
    @employee = Unirest.get("http://localhost:3000/api/v2/employees/#{id}").body
  end
end
