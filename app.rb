require_relative './person_class'
require_relative './student_class'
require_relative './teacher_class'
require_relative './book_class'
require_relative './rental_class'
require_relative './user_options'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    options = UserOptions.new
    puts "\nWelcome to School Library App!"
    keep_loop = true
    while keep_loop
      options.user_options
      print 'Answer: '
      choice = gets.chomp
      choosing_answers(choice)
    end
  end

  def choosing_answers(choice)
    case choice
    when '1'
      Book.list_books(@books)
    when '2'
      Person.list_people(@people)
    when '3'
      @people << Person.create_person
    when '4'
      @books << Book.create_book
    when '5'
      @rentals << Rental.create_rental(@books, @people)
    when '6'
      Rental.list_rentals(@rentals, @people)
    else
      puts 'Goodbye!'
      exit
    end
  end

  def create_student
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
    add_student(student_classroom, student_age, student_name, has_permission)
    puts "\nStudent created successfully.\n"
  end

  def add_student(student_classroom, student_age, student_name, has_permission)
    new_student = Student.new(student_classroom, student_age, student_name, has_permission)
    @people << new_student
  end

  def create_teacher
    print 'Age: '
    teacher_age = gets.chomp
    print 'Name: '
    teacher_name = gets.chomp.capitalize
    print 'Specialization: '
    teacher_specialization = gets.chomp.capitalize
    add_teacher(teacher_age, teacher_name, teacher_specialization, true)
    puts "\nTeacher created successfully.\n"
  end

  def add_teacher(teacher_specialization, teacher_age, teacher_name, has_permission)
    new_teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name, has_permission)
    @people << new_teacher
  end
end
