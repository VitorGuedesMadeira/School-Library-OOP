require_relative '../rental_class'
require_relative '../book_class'
require_relative '../person_class'

describe Rental do
  before(:each) do
    @single_book = Book.new('Harry Potter', 'J.K.Rowling')
    @single_person = Person.new(30, 'Vitor', true)
    @new_rental = Rental.new('1992/04/28', @single_book, @single_person)
  end

  describe 'Rental#date getter' do
    it 'The Rental class getter should return date "1992/04/28"' do
      expect(@new_rental.date).to eql '1992/04/28'
    end
  end

  describe 'Rental#book getter' do
    it 'The Rental class getter should return date the right book' do
      expect(@new_rental.book).to eql @single_book
    end
  end
end
