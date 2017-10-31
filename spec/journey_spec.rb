require './lib/journey'

describe Journey do

  let(:station) { double :station }

  subject { described_class.new }
  context 'It starts and finish a journey' do
    it 'returns the entry station' do
      subject.start(station)
      expect(subject.entry_station).to eq(station)
    end
    it 'returns exit_station' do
      subject.start(station)
      subject.finish(station)
      expect(subject.exit_station).to eq(station)
    end
  end

  context 'When in a Journey' do
    it 'Saves the journey' do
      subject.start(station)
      subject.finish(station)
      expect(subject.journey_list).to eq ({station => station})
    end
  end

end
