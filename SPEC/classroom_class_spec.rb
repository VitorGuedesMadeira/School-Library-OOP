require_relative '../classroom_class'

describe Classroom do
  before(:each) do
    @new_classroom = Classroom.new('Brazilian Classroom')
  end

  describe 'Classroom#label getter' do
    it 'The Classroom class getter should return "Brazilian Classroom"' do
      expect(@new_classroom.label).to eql 'Brazilian Classroom'
    end
  end

  describe 'Classroom#students getter' do
    it 'The Classroom class getter should return an empty array' do
      expect(@new_classroom.students).to eql []
    end
  end
end
