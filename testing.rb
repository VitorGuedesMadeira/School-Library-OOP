require_relative 'book_class'
require 'json'

new_book1 = Book.new('Vitor', '1')
new_book2 = Book.new('Karla', '2')
new_book3 = Book.new('Francis', '3')
new_book4 = Book.new('Mumenya', '4')
@books = []
@books << new_book1
@books << new_book2
@books << new_book3
@books << new_book4

def read_book_data
  if File.exist?('testing.json')
    books_file = File.open('testing.json')
    data = JSON.parse(books_file.read)
    data.each do |book|
      @books << Book.new(book['title'], book['author'])
    end
    books_file.close
  else
    @books = []
  end
end

def books_data(books)
  books_data_array = []
  books.each do |item|
    books_data_array << {
      title: item.title,
      author: item.author
    }
  end
  books_data_array
end
File.write('./testing.json', JSON.pretty_generate(books_data(@books))) # writing
