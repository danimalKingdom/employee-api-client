class Employee

  attr_accessor :id, :full_name, :email, :birthday, :addresses

  def initialize(hash)
    @id = hash['id']
    @full_name = hash['full_name']
    @email = hash['email']
    @birthday = hash['birthday']
    @addresses = hash['addresses'] #=> array
  end

  def self.find(id)
    employee_hash = Unirest.get("#{ENV['API_BASE_URL']}/employees/#{id}", :headers => {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}"}).body #=> a hash of an employee
    Employee.new(employee_hash)
  end

  def self.all
    employees = [] 
    api_employees = Unirest.get("#{ENV['API_BASE_URL']}/employees.json", :headers => {"X-User-Email" => ENV['API_EMAIL'], "Authorization" => "Token token=#{ENV['API_KEY']}"}).body #returns array of hashes
    api_employees.each do |employee_hash|
      employees << Employee.new(employee_hash)
    end
    employees
  end

  def destroy
    Unirest.delete("#{ENV['API_BASE_URL']}/employees/#{@id}").body
  end

  def friendly_birthday
    birthdate = Date.parse(@birthday)
    birthdate.strftime('%b %d, %Y')
  end

end