class Employee

  attr_accessor :id, :full_name, :email, :birthday, :addresses

  def initialize(hash)
    @id = hash['id']
    @full_name = hash['full_name']
    @email = hash['email']
    @birthday = hash['birthday']
    @addresses = hash['addresses'] #=> array
  end

  def friendly_birthday
    birthdate = Date.parse(@birthday)
    birthdate.strftime('%b %d, %Y')
  end

  def self.find(id)
    employee_hash = Unirest.get("http://localhost:3000/api/v2/employees/#{id}").body #=> a hash of an employee
    Employee.new(employee_hash)
  end

end