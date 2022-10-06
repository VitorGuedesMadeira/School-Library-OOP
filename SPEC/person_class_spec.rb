require_relative '../person_class'

describe Person do
  before(:each) do
    @new_person = Person.new(30, 'Vitor', true)
  end

  describe 'Person#name getter' do
    it 'The Person class getter should return "Vitor"' do
      expect(@new_person.name).to eql 'Vitor'
    end
  end

  describe 'Person#name getter' do
    it 'The Person class getter should return true for "Vit"' do
      expect(@new_person.name).to include 'Vit'
    end
  end

  describe 'Person instanceOf' do
    it 'The Person class getter should return true' do
      expect(@new_person).to be_instance_of Person
    end
  end

  describe 'Person#age getter' do
    it 'The Person class getter should return 30' do
      expect(@new_person.age).to eql 30
    end
  end

  describe 'Person#parent_permission getter' do
    it 'The Person class getter should return true' do
      expect(@new_person.parent_permission).to eql true
    end
  end
end
