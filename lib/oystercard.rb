require_relative 'station'
require_relative 'journey'
# comment
class Oystercard
  attr_accessor :balance

  LIMIT = 90
  MIN_FUND = 1

  def initialize
    @balance = 0
    @journey = nil
    @history = []
  end

  def top_up(amount)
    raise "Balnce limit is £#{LIMIT}, try again" if full?(amount)
    @balance += amount
  end

  def touch_in(station = Station.new('Liverpool Street', 1), journey = Journey.new)
    raise 'Not enough funds' if low_funds
    @journey = journey
    @journey.start(station)
  end

  def touch_out(station = Station.new('Bowroad', 2))
    @journey.finish(station)
    store_history
    nil
  end

  def store_history
    @history << @journey.journey_list
  end

  private
  def full?(amount)
    @balance + amount > LIMIT
  end

  def penalty
    @journey.in_journey?
  end

  def deduct(amount)
    @balance -= amount
  end

  def low_funds
    MIN_FUND > @balance
  end
end
