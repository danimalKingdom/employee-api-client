class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("http://localhost:3000/api/v2/employees").body
  end
  def show
    id = params[:id]
    @employee = Unirest.get("http://localhost:3000/api/v2/employees/#{id}").body
  end
  def new
    render :new
  end
  def create
    @employee = Unirest.post("http://localhost:3000/api/v2/employees", :parameters => {first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}).body
    redirect_to employee_path(@employee['id'])
  end
end
