require_relative '../console'

RSpec.describe Console do
  subject { described_class.new }

  describe '#read' do
    let(:input) { StringIO.new }

    it 'reads the commands and outputs each rover final position and bearing' do
      input.puts '5 5'
      input.puts '1 2 N'
      input.puts 'LMLMLMLMM'
      input.puts '3 3 E'
      input.puts 'MMRMMRMRRM'
      input.puts 'END'
      input.rewind

      $stdin = input

      msg = <<~OUTPUT
        1 3 N
        5 1 E
      OUTPUT

      expect { subject.read }.to output(msg).to_stdout

      $stdin = STDIN
    end
  end
end
