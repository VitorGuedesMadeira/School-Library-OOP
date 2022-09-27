class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @parent_permission = parent_permission
    @name = name
    @age = age
  end

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    (@age >= 18 || @parent_permission)
  end
end
