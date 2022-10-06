require_relative '../nameable_class'

describe Nameable do
  before(:each) do
    @new_nameable = Nameable.new
  end

  describe '#new nameable' do
    it 'Can raise an error' do
      expect { @new_nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
