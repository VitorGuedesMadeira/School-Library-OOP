class UserOptions
  def user_options
    options = [
      '',
      '     [1] List all books',
      '     [2] List all people',
      '     [3] Create a person',
      '     [4] Create a book',
      '     [5] Create a rental',
      '     [6] List all rentals for a given person id',
      '     [7] List all students',
      '     [8] List all teachers',
      '     [9] Exit',
      ''
    ]
    puts '_____________________________________________'
    puts "\nPlease choose an option by entering a number:"
    puts options
  end
end
