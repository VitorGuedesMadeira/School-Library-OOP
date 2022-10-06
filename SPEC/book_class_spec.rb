require_relative '../book_class'

describe Book do
  before(:each) do
    @single_person = Person.new(30, 'Vitor', true)
    @new_book = Book.new('Harry Potter', 'J.K.Rowling')
    @new_book.add_rental(@single_person, '28/04/1992')
  end

  describe 'Book#title getter' do
    it 'The Book class getter should return "Harry Potter"' do
      expect(@new_book.title).to eql 'Harry Potter'
    end
  end

  describe 'Book#author getter' do
    it 'The Book class getter should not return "Tolkien"' do
      expect(@new_book.author).not_to eql 'Tolkien'
    end
  end

  describe 'Book#author getter' do
    it 'The Book class getter should not return true' do
      expect(@new_book).to be_instance_of Book
    end
  end

  describe 'Book# add_rental setter' do
    it 'The Book class getter should return 1' do
      expect(@new_book.rentals.length).to be(1)
    end
  end

  describe 'Book# add_rental setter' do
    it 'The Book class getter should not return 2' do
      expect(@new_book.rentals.length).not_to be(2)
    end
  end

  describe 'Book# add_rental setter' do
    it 'The Book class getter should not return 2' do
      expect(@new_book.rentals.length).not_to be(2)
    end
  end
end
