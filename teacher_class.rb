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

  def self.create_teacher
    print 'Age: '
    teacher_age = gets.chomp
    print 'Name: '
    teacher_name = gets.chomp.capitalize
    print 'Specialization: '
    teacher_specialization = gets.chomp.capitalize
    puts "\nTeacher created successfully.\n"
    return Teacher.new(teacher_specialization, teacher_age, teacher_name, true)
  end

  def can_use_services?
    true
  end
end
