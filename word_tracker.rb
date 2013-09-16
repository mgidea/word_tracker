class WordTracker

  def initialize(phrase)
    @phrase = phrase
    @sentence = phrase.split
    @single_letters = @sentence.join.split(//)
    @frequencies = {}
    @punctuations = {}
    @letters = {}

  end

  def punctuation?(word)
   (/\W/).match(word)
  end

  def frequency
    @sentence.each do |word|
      if punctuation?(word)
        new_word = word.gsub(/\W/, "")
      else
        new_word = word
      end

      unless @frequencies.has_key?(new_word)
        @frequencies[new_word.downcase] = 0
      end
        @frequencies[new_word.downcase] += 1
    end
    @frequencies
  end


  def letter_frequency
    @sentence.join.split(//).each do |letter|
      if !punctuation?(letter)
        unless @letters.has_key?(letter)
          @letters[letter.downcase] = 0
        end
          @letters[letter.downcase] += 1
      end
    end
    @letters
  end

  def punctuation_count
    @sentence.join.split(//).each do |punctuation|
      if punctuation?(punctuation)
        unless @punctuations.has_key?(punctuation)
          @punctuations[punctuation] = 0
        end
        @punctuations[punctuation] += 1
      end
    end
    @punctuations
  end

  def most_common_words
    most_common = {}
    frequency
    @frequencies.each do |word, occurrence|
      if @frequencies.values.sort[-3..-1].include?(occurrence)
        most_common[word] = occurrence
      end
    end
    most_common
  end

   def most_common_letters
    most_common = {}
    letter_frequency
    @letters.each do |letter, occurrence|
      if @letters.values.sort[-3..-1].include?(occurrence)
        most_common[letter] = occurrence
      end
    end
    most_common
  end

  def unused
    unused_letters = []
    ("a".."z").each do |letter|
      if !letter_frequency.keys.include?(letter)
        unused_letters << letter
      end
    end
    unused_letters

  end

  def once
    once_words = []
    frequency.each do |word, occurrence|
      if occurrence == 1
        once_words << word
      end
    end
    once_words
  end
end






