# frozen_string_literal: true

# adds capitalization-check method to String
class String
  def capitalized?
    self == capitalize
  end
end

VOWEL = %w[A a E e I i O o U u].freeze
PUNK = %w[. ! ? , ' " - :].freeze
QU = %w[qu Qu].freeze
AY = 'ay'

def translate(original)
  pig_latin = original.split.map do |word|
    if VOWEL.include?(word[0])
      word + AY
    else
      consonants(word)
    end
  end
  pig_latin.join(' ')
end

def consonants(word)
  capital = word.capitalized?
  word = word.split('')
  punk = check_punctuation(word)

  move_consonants(word)
  finished_word(word, capital, punk)
end

def move_consonants(word)
  until VOWEL.include?(word[0])
    get_swap = QU.include?(word[0..1].join) ? word[0..1].join : word[0]
    word.shift(get_swap.length)
    word << get_swap
  end
end

def finished_word(word, capital, punk)
  capital ? handle_punk(capitalized(word.join), punk) : handle_punk(word, punk)
end

def check_punctuation(word)
  punk_letter = false
  punk_index = 0
  word.map.with_index do |letter, i|
    if PUNK.include?(letter)
      punk_letter = letter
      punk_index = i == (word.length - 1) ? -1 : i
      word.delete_at(i)
    end
  end
  [punk_letter, punk_index]
end

def capitalized(word)
  word.downcase.capitalize.split('')
end

def handle_punk(word, punk)
  punk[0] ? (word << AY).insert(punk[1], punk[0]).join : (word << AY).join
end
