class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    puts "#{ENV['API_BASE_URL']}"
  end
  def show
    id = params[:id]
    @employee = Employee.find(id)
  end
  def new
  end
  def create
    @employee = Unirest.post("#{ENV['API_BASE_URL']}/employees", :parameters => {first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}).body
    redirect_to employee_path(@employee['id'])
  end
  def edit
    id = params[:id]
    @employee = Unirest.get("#{ENV['API_BASE_URL']}/employees/#{id}").body
  end
  def update
    id = params[:id]
    @employee = Unirest.patch("#{ENV['API_BASE_URL']}/employees/#{id}", :parameters => {first_name: params[:first_name], last_name: params[:last_name], email: params[:email]}).body
    redirect_to employee_path(@employee['id'])
  end
  def destroy
    id = params[:id]
    @employee = Employee.find(id)
    @employee.destroy
    redirect_to employees_path
  end

end



