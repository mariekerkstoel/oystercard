class Journey

attr_reader :entry_station, :exit_station, :journey_list

  def initialize
    @entry_station = nil
    @exit_station = nil
    @journey_list = {}
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    store_journey
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  def store_journey
    @journey_list = {@entry_station => @exit_station}
  end

  # def not_touched_out
  # @list[-1] == {@entry_station => nil}
  # end
end
