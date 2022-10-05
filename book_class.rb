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
        puts "[#{index}] Title: \"#{book.title}\" | Author: \"#{book.author}\""
      end
    else
      puts "\nWe have no books!"
    end
  end

  def self.create_book
    print 'Title: '
    book_title = gets.chomp.capitalize
    print 'Author: '
    book_author = gets.chomp.capitalize
    puts "\nBook created successfully.\n"
    Book.new(book_title, book_author)
  end
end
