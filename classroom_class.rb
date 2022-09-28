class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    @students.push(student) unless @students.include?(student)
  end
end
