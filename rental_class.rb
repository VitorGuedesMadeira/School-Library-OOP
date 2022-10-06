class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @date = date
  end

  def self.list_rentals(rentals, people)
    if rentals.length.positive?
      Person.list_people(people)
      print 'ID of person: '
      renter_id = gets.chomp
      if rentals.include?(renter_id)
        puts "\nRentals: "
        rentals.each do |rental|
          puts "Book title: \"#{rental.book.title}\", Author: #{rental.book.author}, Date: #{rental.date}" if rental.person.id == renter_id.to_i
        end
      else
        puts 'Invalid ID!'
      end
    else
      puts 'We have no rentals registered!'
    end
  end

  def self.create_rental(books, people)
    if books.length.positive?
      puts 'Select a book from the following list by number:'
      Book.list_books(books)
      print 'Answer: '
      rented_book = gets.chomp.capitalize
      puts 'Select a person from the following list by number (not by id):'
      Person.list_people(people)
      print 'Answer: '
      renter = gets.chomp.capitalize
      print 'Date [yyyy/mm/dd]: '
      date_of_rent = gets.chomp
      puts "\nRental created successfully.\n"
      Rental.new(date_of_rent, books[rented_book.to_i], people[renter.to_i])
    else
      puts 'There are no books to be rented!'
    end
  end
end
