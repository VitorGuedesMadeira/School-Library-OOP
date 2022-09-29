require_relative './person_class'

class Student < Person
  attr_reader :classroom, :age, :parent_permission, :type

  def initialize(classroom, age, name, parent_permission, type = 'Student')
    super(
      age,
      name,
      parent_permission
    )
    @classroom = classroom
    @type = type
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
