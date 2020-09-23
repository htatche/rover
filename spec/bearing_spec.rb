require_relative '../bearing'

RSpec.describe Bearing do
  subject { described_class.new(label_north) }

  let(:label_north) { 'N' }

  describe '#initialize' do
    it 'initializes the class' do
      expect(subject).to be_an_instance_of(Bearing)
    end

    context 'when not given a cardinal point' do
      it 'raises an error' do
        expect { described_class.new('F') }.to raise_error(ArgumentError, 'Invalid bearing')
      end
    end
  end

  describe '#rotate' do
    subject { described_class.new(label_north) }

    context 'when direction is right' do
      it 'updates the bearing clockwise' do
        subject.rotate(:right)

        expect(subject.label).to eq 'E'

        subject.rotate(:right)

        expect(subject.label).to eq 'S'

        subject.rotate(:right)

        expect(subject.label).to eq 'W'

        subject.rotate(:right)

        expect(subject.label).to eq 'N'
      end
    end

    context 'when direction is left' do
      it 'updates the bearing anti-clockwise' do
        subject.rotate(:left)

        expect(subject.label).to eq 'W'

        subject.rotate(:left)

        expect(subject.label).to eq 'S'

        subject.rotate(:left)

        expect(subject.label).to eq 'E'

        subject.rotate(:left)

        expect(subject.label).to eq 'N'
      end
    end
  end

  describe '#ahead_x' do
    it 'returns the value to add to x to move forward' do
      expect(subject.ahead_x).to eq 0
    end
  end

  describe '#ahead_y' do
    it 'returns the value to add to y to move forward' do
      expect(subject.ahead_y).to eq 1
    end
  end

  describe '#label' do
    it 'returns the label for the current bearing' do
      expect(subject.label).to eq 'N'
    end
  end
end
