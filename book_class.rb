class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def self.list_books(books)
    if books.length.positive?
      books.each_with_index do |book, index|
        print "\n[#{index}] Title: \"#{book.title}\" | Author: \"#{book.author}\""
      end
    else
      puts "\nWe have no books!"
    end
  end
end
