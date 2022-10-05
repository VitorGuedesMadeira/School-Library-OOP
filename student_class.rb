require_relative './person_class'

class Student < Person
  attr_reader :classroom, :age, :parent_permission, :type
  attr_accessor :id

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

  def self.create_student
    print 'Age: '
    student_age = gets.chomp
    print 'Name: '
    student_name = gets.chomp.capitalize
    print 'Has parent permission? [y/n]: '
    student_parent_permission = gets.chomp
    has_permission = case student_parent_permission.downcase
                     when 'y'
                       true
                     else
                       false
                     end
    print 'Classroom: '
    student_classroom = gets.chomp
    puts "\nStudent created successfully.\n"
    Student.new(student_classroom, student_age, student_name, has_permission)
  end

  def self.list_all_students(people)
    if people.length.positive?
      people.each do |student|
        puts "ID: #{student.id}, Name: #{student.name}, Age: #{student.age}, Classroom: #{student.classroom}" if student.type == 'Student'
      end
    else
      puts 'We have no students registered!'
    end
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
