require_relative '../plateau'

RSpec.describe Plateau do
  subject { described_class.new }

  describe '#initialize' do
    it 'initializes the class' do
      expect(subject).to be_an_instance_of(Plateau)
    end

    context 'when the dimensions are not positive' do
      it 'raises an error' do
        expect { described_class.new(0, 10) }.to raise_error(ArgumentError, 'Invalid dimensions')
      end
    end

    context 'when the dimensions are not integers' do
      it 'raises an error' do
        expect { described_class.new(1.1, 10) }.to raise_error(ArgumentError, 'Invalid dimensions')
      end
    end

    context 'when the dimensions are plain wrong' do
      it 'raises an error' do
        expect { described_class.new('a') }.to raise_error(ArgumentError, 'Invalid dimensions')
      end
    end
  end
end
