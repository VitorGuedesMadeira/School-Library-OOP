require_relative '../decorator_base'
require_relative '../person_class'

describe Decorator do
  before(:each) do
    @new_person = Person.new(30, 'Vitor', true)
    @new_decorator = Decorator.new(@new_person)
  end

  describe '#new decorated person' do
    it 'Test correct name method' do
      expect(@new_decorator).to be_instance_of Decorator
    end
  end
end
