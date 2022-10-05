require_relative './person_class'
require_relative './student_class'
require_relative './teacher_class'
require_relative './book_class'
require_relative './rental_class'
require_relative './user_options'
require_relative './save_files'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def run
    @books = SaveFiles.read_books
    @people = SaveFiles.read_people
    @rentals = SaveFiles.read_rentals
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
    when '7'
      Student.list_all_students(@people)
    when '8'
      Teacher.list_all_teachers(@people)
    when '9'
      SaveFiles.write_books(@books)
      SaveFiles.write_people(@people)
      SaveFiles.write_rentals(@rentals)
      puts 'Goodbye! :)'
      exit
    else
      puts 'Please insert a valid number!'
    end
  end
end
