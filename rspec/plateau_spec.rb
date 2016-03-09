require_relative '../lib/plateau'

describe Plateau do
  let(:upper_x) {5}
  let(:upper_y) {5}

  subject(:plateau) {Plateau.new(upper_x, upper_y)}

  describe '#new' do
    it 'must be a Plateau object' do
      expect(subject).to be_a Plateau
    end
  end

  it {should respond_to(:top_x)}
  it {should respond_to(:top_y)}
  it {expect(subject.top_x).to eq(upper_x)}
  it {expect(subject.top_y).to eq(upper_y)}

  describe '#is_x_in_bounds?' do
    it 'must check that a valid x is inside bounds' do
      expect(subject.is_x_in_bounds?(3)).to eq(true)
    end

    it 'must check that an invalid x is outside bounds' do
      expect(subject.is_x_in_bounds?(6)).to eq(false)
    end
  end

  describe '#is_y_in_bounds?' do
    it 'must check that a valid y is inside bounds' do
      expect(subject.is_y_in_bounds?(2)).to eq(true)
    end

    it 'must check that an invalid y is outside bounds' do
      expect(subject.is_y_in_bounds?(8)).to eq(false)
    end
  end

end
