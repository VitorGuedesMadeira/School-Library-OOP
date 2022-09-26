class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = "Unknown", age = true, parent_permission)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # name setter
  def setname=(name)
    @name = name
  end

  # age setter
  def setage=(age)
    @age = age
  end

  # private methods
  def is_of_age?
    @age >= 18 ? true : false
  end

  def can_use_services?
    (@age >= 18 || @parent_permission) ? true : false
  end
end