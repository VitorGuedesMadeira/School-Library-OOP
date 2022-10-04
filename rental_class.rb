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
    print 'ID of person: '
    renter_id = gets.chomp
    puts 'Rentals: '
    rentals.each do |rental|
      if rental.person.id == renter_id.to_i
        puts "\nDate: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
