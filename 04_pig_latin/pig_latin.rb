# frozen_string_literal: true

VOWEL = %w[a e i o u].freeze
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
  word = word.split('')

  until VOWEL.include?(word[0])
    grab_letter = word[0..1].join == 'qu' ? word[0..1].join : word[0]
    word.shift(grab_letter.length)
    word << grab_letter
  end
  (word << AY).join
end
