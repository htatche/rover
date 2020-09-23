require_relative '../rover'

RSpec.describe Rover do
  subject { described_class.new(plateau) }

  let(:plateau) { Plateau.new }

  describe '#initialize' do
    it 'initializes the class' do
      expect(subject).to be_an_instance_of(Rover)
    end
  end

  describe '#rotate' do
    subject { described_class.new(plateau, 0, 0, 'N') }

    context 'when rotating left' do
      it 'the rover changes its bearing anti-clockwise' do
        expect { subject.rotate(:left) }.to change { subject.bearing.label }.from('N').to('W')
        expect { subject.rotate(:left) }.to change { subject.bearing.label }.from('W').to('S')
        expect { subject.rotate(:left) }.to change { subject.bearing.label }.from('S').to('E')
        expect { subject.rotate(:left) }.to change { subject.bearing.label }.from('E').to('N')
      end
    end
  end

  describe '#move' do
    context 'when the bearing is N' do
      subject { described_class.new(plateau, 5, 5, 'N') }

      it 'moves the rover towards the North' do
        subject.move

        expect(subject.position.x).to eq 5
        expect(subject.position.y).to eq 6
      end
    end

    context 'when the bearing is E' do
      subject { described_class.new(plateau, 5, 5, 'E') }

      it 'moves the rover towards the East' do
        subject.move

        expect(subject.position.x).to eq 6
        expect(subject.position.y).to eq 5
      end
    end

    context 'when the bearing is S' do
      subject { described_class.new(plateau, 5, 5, 'S') }

      it 'moves the rover towards the South' do
        subject.move

        expect(subject.position.x).to eq 5
        expect(subject.position.y).to eq 4
      end
    end

    context 'when the bearing is W' do
      subject { described_class.new(plateau, 5, 5, 'W') }

      it 'moves the rover towards the West' do
        subject.move

        expect(subject.position.x).to eq 4
        expect(subject.position.y).to eq 5
      end
    end
  end
end
