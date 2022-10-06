require_relative '../decorator_capitalize'
require_relative '../person_class'

describe CapitalizeDecorator do
  before(:each) do
    @new_person = Person.new(30, 'vitor', true)
    @new_capitalize = CapitalizeDecorator.new(@new_person)
  end

  describe '#new capitalized person' do
    it 'Test correct name method to capital letter' do
      expect(@new_capitalize.correct_name).to eq 'Vitor'
    end
  end
end
