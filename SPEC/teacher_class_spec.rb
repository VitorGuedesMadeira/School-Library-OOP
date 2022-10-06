require_relative '../teacher_class'

describe Teacher do
  before(:each) do
    @new_teacher = Teacher.new(27, 'Sabrina', 'Law', true)
  end

  describe 'Teacher#specialization getter' do
    it 'The Teacher class getter should return "Law"' do
      expect(@new_teacher.specialization).to eql 'Law'
    end
  end

  describe 'Teacher#age getter' do
    it 'The Teacher class getter should not return "20"' do
      expect(@new_teacher.age).not_to eql '20'
    end
  end

  describe 'Teacher#can_use_service?' do
    it 'can_use_services should return true' do
      expect(@new_teacher.can_use_services?).not_to be_falsey
    end
  end
end
