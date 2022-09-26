require_relative 'personClass'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization)
    @specialization = specialization
  end

  def can_use_services?
    return true
  end
end
