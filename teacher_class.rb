require_relative './person_class'

class Teacher < Person
  attr_accessor :specialization
  attr_reader :type

  def initialize(age, name, specialization, parent_permission, type = 'Teacher')
    @specialization = specialization
    super(
      age,
      name,
      parent_permission
    )
    @type = type
  end

  def can_use_services?
    true
  end
end
