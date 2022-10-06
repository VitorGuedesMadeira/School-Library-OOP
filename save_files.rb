require 'json'
require_relative 'book_class'
require_relative 'person_class'
require_relative 'student_class'
require_relative 'teacher_class'
require_relative 'rental_class'

class SaveFiles
  # write books
  def self.write_books(books)
    books_data_array = []
    books.each do |book|
      books_data_array << {
        title: book.title,
        author: book.author
      }
    end
    File.write('./DATA/books.json', JSON.pretty_generate(books_data_array))
  end

  # read books
  def self.read_books
    array_books = []
    return array_books unless File.exist?('./DATA/books.json')

    books_file = File.open('./DATA/books.json')
    data = JSON.parse(books_file.read)
    data.each do |book|
      array_books << Book.new(book['title'], book['author'])
    end
    books_file.close
    array_books
  end

  # write people
  def self.write_people(people)
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

  # read people
  def self.read_people
    array_people = []
    return array_people unless File.exist?('./DATA/people.json')

    people_file = File.open('./DATA/people.json')
    data = JSON.parse(people_file.read)
    data.each do |person|
      if person['class'] == 'Student'
        student = Student.new(person['classroom'], person['age'], person['name'], person['parent_permission'])
        student.id = person['id']
        array_people << student
      else
        teacher = Teacher.new(person['age'], person['name'], person['specialization'],
                              person['parent_permission'])
        teacher.id = person['id']
        array_people << teacher
      end
    end
    people_file.close
    array_people
  end

  # write rentals
  def self.write_rentals(rentals)
    rentals_data_array = []
    rentals.each do |rental|
      rentals_data_array << {
        date: rental.date,
        book: {
          title: rental.book.title,
          author: rental.book.author
        },
        person: {
          id: rental.person.id,
          name: rental.person.name,
          age: rental.person.age,
          parent_permission: rental.person.parent_permission
        }
      }
    end
    File.write('./DATA/rentals.json', JSON.pretty_generate(rentals_data_array))
  end

  # read rentals
  def self.read_rentals
    array_rentals = []
    return array_rentals unless File.exist?('./DATA/rentals.json')

    rentals_file = File.open('./DATA/rentals.json')
    data = JSON.parse(rentals_file.read)
    data.each do |rental|
      single_person = Person.new(rental['person.age'], rental['person.name'], rental['person.parent_permission'])
      single_person.id = rental['person.id']
      single_book = Book.new(rental['book.title'], rental['book.author'])
      single_rental = Rental.new(rental['date'], single_book, single_person)
      array_rentals << single_rental
    end
    rentals_file.close
    array_rentals
  end
end
