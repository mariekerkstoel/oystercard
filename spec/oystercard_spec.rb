require 'oystercard'
describe Oystercard do
  let(:card) { described_class.new }
  let(:station) { double :station }

  describe '#balance' do
    it 'should be initialized with a default value of £0' do
      expect(card.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'should add the designated sum to the balance' do
      card.top_up(5)
      expect(card.balance).to eq(5)
    end
    it 'should add the designated sum to the balance' do
      card.top_up(5)
      card.top_up(5)
      expect(card.balance).to eq(10)
    end
    it 'should never amount to more than £90' do
      card.top_up(40)
      expect { card.top_up(51) }.to raise_error 'Balnce limit is £90, try again'
    end
  end

  context 'Touching in and out' do
    it 'Should return nil if touched out' do
      subject.top_up(5)
      subject.touch_in(station)
      expect(subject.touch_out(station)).to eq(nil)
    end
    it 'Should raise error if touch in with low funds' do
      expect { subject.touch_in }.to raise_error 'Not enough funds'
    end
  end
end
