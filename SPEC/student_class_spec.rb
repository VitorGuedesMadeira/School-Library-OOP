require_relative '../student_class'

describe Student do
  before(:each) do
    @new_student = Student.new('Brazil', 30, 'Vitor', true)
  end

  describe 'Student#type getter' do
    it 'The Student class getter should return "Student"' do
      expect(@new_student.type).to eql 'Student'
    end
  end
end