require 'json'
require_relative 'book_class'

class SaveFiles
    def self.writeBooks(books)
        books_data_array = []
        books.each do |book|
          books_data_array << {
            title: book.title,
            author: book.author
          }
        end
        File.write('books.json', JSON.pretty_generate(books_data_array))
    end

    def self.readBooks(books)
        if File.exist?('books.json')
          array_books = []
          books_file = File.open('books.json')
          data = JSON.parse(books_file.read)
          data.each do |book|
            array_books << Book.new(book['title'], book['author'])
          end
          books_file.close
          return array_books
        else
          array_books = []
        end
      end
end