# frozen_string_literal: true

def echo(say)
  say.to_s
end

def shout(say)
  say.to_s.upcase
end

def repeat(say, num = 2)
  ("#{say} " * num).split.join(' ')
end

def start_of_word(word, num)
  word[0..(num - 1)]
end

def first_word(words)
  words.split[0]
end

def titleize(title)
  little_words = %w[and the over]
  title =
    title.split.map.with_index do |word, i|
      little_words.include?(word) && i != 0 ? word : word.capitalize
    end
  title.join(' ')
end
