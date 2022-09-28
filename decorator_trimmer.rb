require_relative 'decorator_base'

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0..9]
  end
end
