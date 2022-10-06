require_relative '../classroom_class'

describe Classroom do
  before(:each) do
    @new_classroom = Classroom.new('Brazilian Classroom')
    @new_classroom.add_student('Francis')
    @new_classroom.add_student('Vitor')
  end

  describe 'Classroom#label getter' do
    it 'The Classroom class getter should return "Brazilian Classroom"' do
      expect(@new_classroom.label).to eql 'Brazilian Classroom'
    end
  end

  describe 'Classroom#students getter' do
    it 'The Classroom class getter should not return an empty array' do
      expect(@new_classroom.students).not_to eql []
    end
  end

  describe 'Classroom#students getter' do
    it 'The Classroom class getter should return an array with 2 students' do
      expect(@new_classroom.students).to have_attributes(size: 2)
    end
  end
end
