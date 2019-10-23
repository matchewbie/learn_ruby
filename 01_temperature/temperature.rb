# frozen_string_literal: true

def ftoc(deg)
  (deg - 32.0) * (5.0 / 9.0)
end

def ctof(deg)
  deg * (9.0 / 5.0) + 32.0
end
