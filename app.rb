require_relative './student_class'
require_relative './teacher_class'
require_relative './book_class'
require_relative './rental_class'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # STUDENTS/TEACHERS
  def list_people
    if @people.length.positive?
      @people.each_with_index do |person, index|
        print "\n[#{index}] [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts "\nNo students/teachers registered!"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
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
    print "\nStudent created successfully.\n"
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
    print "\nTeacher created successfully.\n"
  end

  def add_teacher(teacher_specialization, teacher_age, teacher_name, has_permission)
    new_teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name, has_permission)
    @people << new_teacher
  end

  # BOOKS
  def list_books
    if @books.length.positive?
      @books.each_with_index do |book, index|
        print "\n[#{index}] Title: \"#{book.author}\""
      end
    else
      puts "\nWe have no books!"
    end
  end

  def create_book
    print 'Title: '
    book_title = gets.chomp.capitalize
    print 'Author: '
    book_author = gets.chomp.capitalize
    add_book(book_title, book_author)
    print "\nBook created successfully.\n"
  end

  def add_book(book_title, book_author)
    new_book = Book.new(book_title, book_author)
    @books << new_book
  end

  # RENTALS
  def list_rentals
    list_people
    print 'ID of person: '
    renter_id = gets.chomp
    puts 'Rentals: '
    list_rental_by_id(renter_id.to_i)
  end

  def list_rental_by_id(renter_id)
    @rentals.each do |rental|
      if rental.person.id == renter_id
        puts "\nDate: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def create_rental
    if books.length.positive?
      puts 'Select a book from the following list by number'
      list_books
      rented_book = gets.chomp.capitalize
      puts 'Select a person from the following list by number (not by id)'
      list_people
      renter = gets.chomp.capitalize
      puts 'Date [yyyy/mm/dd]: '
      date_of_rent = gets.chomp
      add_rental(date_of_rent, rented_book, renter)
      print "\nRental created successfully.\n"
    else
      puts 'There are no books to be rented!'
    end
  end

  def add_rental(date_of_rent, rented_book, renter)
    new_rental = Rental.new(date_of_rent, @books[rented_book.to_i], @people[renter.to_i])
    @rentals << new_rental
  end
end
