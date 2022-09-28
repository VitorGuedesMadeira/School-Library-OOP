require_relative 'nameable_class'

class Decorator < Nameable
  attr_accessor :nameable

  def intialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
