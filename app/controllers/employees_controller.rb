class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("http://localhost:3000/api/v2/employees").body
  end
  def show
    id = params[:id]
    employee_hash = Unirest.get("http://localhost:3000/api/v2/employees/#{id}").body #=> a hash of an employee
    @employee = Employee.new(employee_hash)
  end
  def new
    render :new
  end
  def create
    @employee = Unirest.post("http://localhost:3000/api/v2/employees", :parameters => {first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}).body
    redirect_to employee_path(@employee['id'])
  end
  def edit
    id = params[:id]
    @employee = Unirest.get("http://localhost:3000/api/v2/employees/#{id}").body
  end
  def update
    id = params[:id]
    @employee = Unirest.patch("http://localhost:3000/api/v2/employees/#{id}", :parameters => {first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}).body
    redirect_to employee_path(@employee['id'])
  end
  def destroy
    id = params[:id]
    @employee = Unirest.delete("http://localhost:3000/api/v2/employees/#{id}").body
    redirect_to employees_path
  end

end



