require_relative '../lib/rover'
require_relative '../lib/plateau'

describe Rover do
  let(:upper_x) {5}
  let(:upper_y) {5}
  let(:x) {1}
  let(:y) {2}
  let(:compass) {'N'}

  subject(:rover) {Rover.new(Plateau.new(upper_x, upper_y), x, y, compass)}

  describe '#new' do
    it 'must be a Rover object' do
      expect(subject).to be_a Rover
    end
  end

  describe '#get_position' do
    it 'must return the current position of the rover (1 2 N)' do
      expect(subject.get_position).to eq('1 2 N')
    end
  end

  describe '#rotate' do
    context 'Rotate L' do
      it 'must rotate from N to W' do
        subject.rotate('L')
        expect(subject.get_position).to eq('1 2 W')
      end
    end

    context 'Rotate R' do
      it 'must rotate from N to E' do
        subject.rotate('R')
        expect(subject.get_position).to eq('1 2 E')
      end
    end
  end

  describe '#move' do
    context 'Move in bounds' do
      it 'must increase y when moving to N' do
        subject.move
        expect(subject.get_position).to eq('1 3 N')
      end
      it 'must decrease y when moving to S' do
        subject.rotate('L')
        subject.rotate('L')
        subject.move
        expect(subject.get_position).to eq('1 1 S')
      end
      it 'must increase x when moving to E' do
        subject.rotate('R')
        subject.move
        expect(subject.get_position).to eq('2 2 E')
      end
      it 'must decrease x when moving to W' do
        subject.rotate('L')
        subject.move
        expect(subject.get_position).to eq('0 2 W')
      end
    end
    context 'Move out of bounds' do
      it 'must not move out of bones by W' do
        subject.rotate('L')
        subject.move
        subject.move
        expect(subject.get_position).to eq('0 2 W')
      end
      it 'must not move out of bones by S' do
        subject.rotate('L')
        subject.rotate('L')
        subject.move
        subject.move
        subject.move
        expect(subject.get_position).to eq('1 0 S')
      end
    end
  end

end
