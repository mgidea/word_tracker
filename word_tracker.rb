class WordTracker

  def initialize(phrase)
    @sentence = phrase.split
    @frequencies = Hash.new(0)
    @punctuations = Hash.new(0)
    @letters = Hash.new(0)

  end

  def pull_out_letters
    @sentence.join.split(//)
  end

  def letters
    pull_out_letters.reject{|letter| punctuation?(letter)}
  end

  def punctuations
    pull_out_letters.select{|letter| punctuation?(letter)}
  end

  def punctuation?(word)
   (/\W/).match(word)
  end

  def lose_punctuations(word)
    if punctuation?(word)
        word = word.gsub(/\W/, "")
    end
    word
  end

  def clean_sentence
    @sentence.map{|word| lose_punctuations(word)}
  end

  def frequency
    sentence = clean_sentence
    sentence.each do |word|
      @frequencies[word.downcase] += 1
    end
    @frequencies
  end


  def letter_frequency
    letters.each do |letter|
      @letters[letter.downcase] += 1
    end
    @letters
  end

  def punctuation_count
    punctuations.each do |punctuation|
      @punctuations[punctuation] += 1
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






