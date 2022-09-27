class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(parent_permission: true, name = 'Unknown', age)
    @id = Random.rand(1...1000)
    @parent_permission = parent_permission
    @name = name
    @age = age
  end

  # private methods
  def of_age?
    @age >= 18
  end

  def can_use_services?
    (@age >= 18 || @parent_permission)
  end
end
