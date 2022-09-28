require_relative './person_class'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization)
    @specialization = specialization
    super(
      age,
      name,
      parent_permission
    )
  end

  def can_use_services?
    true
  end
end
