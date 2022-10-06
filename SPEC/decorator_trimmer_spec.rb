require_relative '../decorator_trimmer'
require_relative '../person_class'

describe TrimmerDecorator do
  before(:each) do
    @new_person = Person.new(30, 'Vitor Guedes', true)
    @new_trimmer = TrimmerDecorator.new(@new_person)
  end

  describe '#new trimmed person' do
    it 'Test correct name method maximum 9 characters' do
      expect(@new_trimmer.correct_name).to eq 'Vitor Gued'
    end
  end
end
