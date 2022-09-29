require_relative './person_class'

class Student < Person
  attr_reader :classroom

  def intialize(classroom)
    super(
      age,
      name,
      parent_permission
    )
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
