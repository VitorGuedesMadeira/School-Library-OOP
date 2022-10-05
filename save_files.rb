require 'json'
require_relative 'book_class'
require_relative 'person_class'
require_relative 'student_class'
require_relative 'teacher_class'
require_relative 'rental_class'

class SaveFiles
    #write books
    def self.writeBooks(books)
        books_data_array = []
        books.each do |book|
          books_data_array << {
            title: book.title,
            author: book.author
          }
        end
        File.write('./DATA/books.json', JSON.pretty_generate(books_data_array))
    end
    #read books
    def self.readBooks
        if File.exist?('./DATA/books.json')
          array_books = []
          books_file = File.open('./DATA/books.json')
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

      #write people
      def self.writePeople(people)
        people_data_array = []
        people.each do |person|
            if person.instance_of?(Student)
              people_data_array << {
                class: person.class, age: person.age, name: person.name, classroom: person.classroom, id: person.id, parent_permission: person.parent_permission
              }
            else
              people_data_array << {
                class: person.class, age: person.age, name: person.name, specialization: person.specialization, id: person.id, parent_permission: person.parent_permission
              }
            end
        end
        File.write('./DATA/people.json', JSON.pretty_generate(people_data_array))
    end
    #read people
    def self.readPeople
        if File.exist?('./DATA/people.json')
          array_people = []
          people_file = File.open('./DATA/people.json')
          data = JSON.parse(people_file.read)
          data.each do |person|
            if person['class'] == 'Student'
              student = Student.new(person["classroom"], person["age"], person["name"], person["parent_permission"])
              student.id = person['id']
              array_people << student
            else
              teacher = Teacher.new(person['age'], person['name'], person['specialization'], person["parent_permission"])
              teacher.id = person['id']
              array_people << teacher
            end
          end
          people_file.close
          return array_people
        else
          array_people = []
        end
      end

    #write rentals
    def self.writeRentals(rentals)
        rentals_data_array = []
        rentals.each do |rental|
          rentals_data_array << {
            date: rental.date,
            title: rental.book.title,
            author: rental.book.author,
            id: rental.person.id,
            name: rental.person.name,
          }
        end
        File.write('./DATA/rentals.json', JSON.pretty_generate(rentals_data_array))
    end
    #read rentals
    def self.readRentals
      if File.exist?('./DATA/rentals.json')
        array_rentals = []
        rentals_file = File.open('./DATA/rentals.json')
        data = JSON.parse(rentals_file.read)
        data.each do |rental|
          single_rental = Rental.new(rental['date'], rental['book'], rental['person'])
          array_rentals << single_rental
        end
        rentals_file.close
        return array_rentals
      else
        array_rentals = []
      end
    end
end
