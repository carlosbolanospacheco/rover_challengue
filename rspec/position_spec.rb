require_relative '../lib/position'
require_relative '../lib/plateau'

describe Position do
  let(:upper_x) {5}
  let(:upper_y) {5}
  let(:x) {1}
  let(:y) {2}
  let(:compass) {'N'}

  subject(:position) {Position.new(Plateau.new(upper_x, upper_y), x, y, compass)}

  describe '#new' do
    it 'must be a Position object' do
      expect(subject).to be_a Position
    end
  end

  it {should respond_to(:x)}
  it {should respond_to(:y)}
  it {should respond_to(:compass)}
  it {expect(subject.x).to eq(x)}
  it {expect(subject.y).to eq(y)}
  it {expect(subject.compass).to eq(0)}

  describe '#get_position' do
    it 'must return the current coordinates of position (1 2 N)' do
      expect(subject.get_position).to eq('1 2 N')
    end
  end

  describe '#rotate' do
    context 'Rotate L' do
      it 'must rotate from N to W' do
        subject.rotate('L')
        expect(subject.compass).to eq(270)
      end
    end

    context 'Rotate R' do
      it 'must rotate from N to E' do
        subject.rotate('R')
        expect(subject.compass).to eq(90)
      end
    end
  end

  describe '#forward' do
    context 'Move in bounds' do
      it 'must increase y when moving to N' do
        subject.forward
        expect(subject.y).to eq(3)
      end
      it 'must decrease y when moving to S' do
        subject.rotate('L')
        subject.rotate('L')
        subject.forward
        expect(subject.y).to eq(1)
      end
      it 'must increase x when moving to E' do
        subject.rotate('R')
        subject.forward
        expect(subject.x).to eq(2)
      end
      it 'must decrease x when moving to W' do
        subject.rotate('L')
        subject.forward
        expect(subject.x).to eq(0)
      end
    end
    context 'Move out of bounds' do
      it 'must not move out of bones by W' do
        subject.rotate('L')
        subject.forward
        subject.forward
        expect(subject.x).to eq(0)
      end
      it 'must not move out of bones by S' do
        subject.rotate('L')
        subject.rotate('L')
        subject.forward
        subject.forward
        subject.forward
        expect(subject.y).to eq(0)
      end
    end
  end

end
