class WordTracker

  def initialize(sentence)
    @sentence = sentence.split
    @frequencies ={}
  end

  def frequency
    @sentence.each do |word|
      if (/\W/).match(word)
        word.sub!(/\W/, "")
      end
      unless @frequencies.has_key?(word)
        @frequencies[word.downcase] = 0
      end
        @frequencies[word.downcase] += 1
    end
    @frequencies
  end

  #    {
  # "toy" => 3,
  # "boat" => 3
  # }


end
