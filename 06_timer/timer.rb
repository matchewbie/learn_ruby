# frozen_string_literal: true

# modular arithmetic with helper method
class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    second = padded(@seconds % 60)
    minute = padded(@seconds / 60 % 60)
    hour = padded(@seconds / 3600 % 60)
    hour + ':' + minute + ':' + second
  end

  def padded(num)
    num.to_s.rjust(2, '0')
  end
end
