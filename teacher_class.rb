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
    Teacher.new(teacher_age, teacher_name, teacher_specialization, true)
  end

  def self.list_all_teachers(people)
    if people.length.positive?
      people.each do |teacher|
        if teacher.type == 'Teacher'
          puts "ID: #{teacher.id}, Name: #{teacher.name}, Age: #{teacher.age}, Specialization: #{teacher.specialization}"
        end
      end
    else
      puts 'We have no teachers registered!'
    end
  end

  def can_use_services?
    true
  end
end
