require_relative '../book_class'

describe Book do
  before(:each) do
    @new_book = Book.new('Harry Potter', 'J.K.Rowling')
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
end