require 'rspec'

require_relative 'word_tracker'

describe WordTracker do
  it "counts the occurrence of each word in a sentence" do
    expect(WordTracker.new('Toy boat toy boat toy boat').frequency).to eql(
      {
  "toy" => 3,
  "boat" => 3
  })
  end

  it "counts different sentence full of words" do
    expect(WordTracker.new("I hate hate, all of this this this, kind of stuff").frequency).to eql(
    {
   "i" => 1,
   "hate" => 2,
   "all" => 1,
   "of" => 2,
   "this" => 3,
   "kind" => 1,
   "stuff" => 1
    }
      )
  end

  it "counts the number of each letter" do
    expect(WordTracker.new("I hate all of this kind of stuff").letter_frequency).to eql(
    {
      "i" => 3,
      "h" => 2,
      "a" => 2,
      "t" => 3,
      "e" => 1,
      "l" => 2,
      "o" => 2,
      "f" => 4,
      "s" => 2,
      "k" => 1,
      "n" => 1,
      "d" => 1,
      "u" => 1
    })
  end

  it "counts the number of each punctuation in the collection" do
    expect(WordTracker.new("I hate, all// of this, kind: of: stuff.").punctuation_count).to eql(
    {
      "," => 2,
      "/" => 2,
      ":" => 2,
      "." => 1,


    })
  end

  it "displays the the most common words" do
    expect(WordTracker.new("I hate hate, all of this this this, kind of stuff").most_common).to eql(
    {
      "this" => 3,
      "hate" => 2,
       "of" => 2
    })
  end
end
