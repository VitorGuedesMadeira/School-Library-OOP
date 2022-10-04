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
      create_person
    when '4'
      @books << Book.create_book
    when '5'
      create_rental
    when '6'
      Rental.list_rentals(@rentals, @people)
    else
      puts 'Goodbye!'
      exit
    end
  end

  # STUDENTS/TEACHERS
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    print "Answer: "
    choice = gets.chomp
    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts '\nInvalid option'
      nil
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



  # RENTALS
  def create_rental
    if @books.length.positive?
      puts 'Select a book from the following list by number:'
      Book.list_books(@books)
      print "Answer: "
      rented_book = gets.chomp.capitalize
      puts 'Select a person from the following list by number (not by id):'
      Person.list_people(@people)
      print "Answer: "
      renter = gets.chomp.capitalize
      print 'Date [yyyy/mm/dd]: '
      date_of_rent = gets.chomp
      add_rental(date_of_rent, rented_book, renter)
      puts "\nRental created successfully.\n"
    else
      puts 'There are no books to be rented!'
    end
  end

  def add_rental(date_of_rent, rented_book, renter)
    new_rental = Rental.new(date_of_rent, @books[rented_book.to_i], @people[renter.to_i])
    @rentals << new_rental
  end
end
