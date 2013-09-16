class WordTracker

  def initialize(phrase)
    @phrase = phrase
    @sentence = phrase.split
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
        new_word = word.sub!(/\W/, "")
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

    # {
    #   "i" => 3,
    #   "h" => 2,
    #   "a" => 2,
    #   "t" => 3,
    #   "e" => 1,
    #   "l" => 2,
    #   "o" => 2,
    #   "s" => 2,
    #   "k" => 1,
    #   "n" => 1,
    #   "d" => 1,
    #   "f" => 3,
    #   "u" => 1
    # }



end
