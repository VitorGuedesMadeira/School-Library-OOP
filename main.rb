require_relative './app'

def main
  app = App.new
  exit_button = true
  puts "\nWelcome to School Library App!"
  while exit_button
    options = [
      '',
      '     [1] List all books',
      '     [2] List all people',
      '     [3] Create a person',
      '     [4] Create a book',
      '     [5] Create a rental',
      '     [6] List all rentals for a given person id',
      '     [7] Exit',
      ''
    ]
    puts '_____________________________________________'
    puts "\nPlease choose an option by entering a number:"
    puts options
    print 'Answer: '
    choice = gets.chomp
    case choice
    when '1'
      app.list_books
    when '2'
      app.list_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_rentals
    else
      puts 'Goodbye!'
      exit_button = false
    end
  end
end

main
