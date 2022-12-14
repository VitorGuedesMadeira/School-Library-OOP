class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @person = person
    person.rentals << self
    @book = book
    book.rentals << self
    @date = date
  end

  def self.list_all_rentals(rentals)
    if rentals.length.positive?
      rentals.each_with_index do |rental, index|
        puts "[#{index + 1}] Book title: \"#{rental.book.title}\", Author: #{rental.book.author}, Date: #{rental.date}"
      end
    else
      puts 'We have no rentals registered!'
    end
  end

  def self.list_individual_rental(rentals, people)
    if rentals.length.positive?
      Person.list_people(people)
      print 'ID of person: '
      renter_id = gets.chomp
      puts "\nRentals: "
      rentals.each do |rental|
        puts "Book title: \"#{rental.book.title}\", Author: #{rental.book.author}, Date: #{rental.date}" if rental.person.id == renter_id.to_i
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
      if books.include?(books[rented_book.to_i])
        puts 'Select a person from the following list by number (not by id):'
        Person.list_people(people)
        print 'Answer: '
        renter = gets.chomp.capitalize
        if people.include?(people[renter.to_i])
          date_of_rent = Time.now
          puts "\nRental created successfully.\n"
          Rental.new(date_of_rent.strftime('%d of %B, %Y'), books[rented_book.to_i], people[renter.to_i])
        else
          puts "\nInvalid number!"
        end
      else
        puts "\nInvalid number!"
      end
    else
      puts 'There are no books to be rented!'
    end
  end
end
