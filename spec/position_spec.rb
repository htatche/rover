require_relative '../position'

RSpec.describe Position do
  subject { described_class.new(plateau) }

  let(:plateau) { Plateau.new(10, 10) }

  describe '#initialize' do
    it 'initializes the class' do
      expect(subject).to be_an_instance_of(Position)
    end

    context 'when coordinates are not integers' do
      it 'raises an error' do
        expect { described_class.new(plateau, 1.1, 2.2) }.to raise_error(ArgumentError, 'Invalid coordinates')
      end
    end

    context 'when coordinates are not within limits' do
      it 'raises an error' do
        expect { described_class.new(plateau, 11, 11) }.to raise_error(ArgumentError, 'Invalid coordinates')
      end
    end
  end

  describe '#forward' do
    subject { described_class.new(plateau, 0, 0) }

    it 'updates to the according new position' do
      bearing = instance_double('Bearing')

      allow(bearing).to receive(:ahead_x).and_return(1)
      allow(bearing).to receive(:ahead_y).and_return(1)

      expect(subject.forward(bearing)).to eq 1
      expect(subject.forward(bearing)).to eq 2
    end
  end
end
