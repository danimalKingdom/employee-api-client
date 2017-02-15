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
    birthday = Date.parse(@birthday)
    birthday.strftime('%b %d, %Y')
  end

end