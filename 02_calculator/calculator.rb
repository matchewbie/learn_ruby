# frozen_string_literal: true

def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(num_array)
  num_array.reduce(0, :+)
end

def multiply(num_array)
  num_array.reduce(1, :*)
end

def power(num1, num2)
  num1**num2
end

def factorial(num)
  (2..num).reduce(1, :*)
end
