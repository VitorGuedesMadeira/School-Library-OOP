require_relative './app'

def main
  puts "\nWelcome to School Library App!"
  app = App.new
  app.run
end

main
