# frozen_string_literal: true

# defined predicate method
class String
  def do_not_capitalize?
    %w[the a an and in of].include?(self)
  end
end

# title capitalization
class Book
  attr_writer :title

  def title
    @title.split.map.with_index do |word, i|
      word.do_not_capitalize? && i != 0 ? word : word.capitalize
    end.join(' ')
  end
end
