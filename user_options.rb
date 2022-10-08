class UserOptions
  def self.user_options
    options = [
      '',
      '     [1] Create a person',
      '     [2] Create a book',
      '     [3] Create a rental',
      '     [4] List all people',
      '     [5] List all books',
      '     [6] List all rentals',
      '     [7] List all rentals for a given person id',
      '     [8] List all students',
      '     [9] List all teachers',
      '     [10] Exit',
      ''
    ]
    puts '_____________________________________________'
    puts "\nPlease choose an option by entering a number:"
    puts options
  end
end
