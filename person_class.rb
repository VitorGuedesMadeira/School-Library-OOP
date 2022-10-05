require_relative './nameable_class'
require_relative './decorator_base'
require_relative './decorator_capitalize'
require_relative './decorator_trimmer'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1...1000)
    @parent_permission = parent_permission
    @name = name
    @age = age
    @rentals = []
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    new_rental = Rental.new(date, book, self)
    @rentals.push(new_rental)
  end

  def can_use_services?
    (@age >= 18 || @parent_permission)
  end

  def self.list_people(people)
    if people.length.positive?
      people.each_with_index do |person, index|
        puts "[#{index}] [#{person.type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    else
      puts "\nNo students/teachers registered!"
    end
  end

  def self.create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    print 'Answer: '
    choice = gets.chomp
    case choice
    when '1'
      Student.create_student
    when '2'
      Teacher.create_teacher
    else
      puts '\nInvalid option'
      nil
    end
  end

  private

  def of_age?
    @age >= 18
  end
end
