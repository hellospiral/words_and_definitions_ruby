require('rspec')
require('word')

describe('Word') do
  before() do
    Word.clear()
  end

  describe(".all") do
    it('is empty at first') do
      expect(Word.all()).to(eq([]))
    end

    it('returns an array of words after being added to') do
      test_word = Word.new("Insane")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('#name') do
    it('returns the name of a word') do
      test_word = Word.new("Insane")
      expect(test_word.name()).to(eq("Insane"))
    end
  end

  describe('#id') do
    it('returns the name of a word') do
      test_word = Word.new("Insane")
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#save') do
    it('adds a word to the array of saved words') do
      test_word = Word.new("Insane")
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('.clear') do
    it('empties the array of saved words') do
      test_word = Word.new("Insane")
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      test_word = Word.new("Dance")
      test_word.save()
      test_word2 = Word.new("Hear")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe('#definitions') do
    it("initially returns an empty array of all the definitions for a word") do
      test_word = Word.new("Mouse")
      expect(test_word.definitions()).to(eq([]))
    end

    it("returns an array of all a word's definitions") do
      test_word = Word.new("Mouse")
      test_definition = Definition.new("a little furry mammal")
      test_definition2 = Definition.new("something else")
      test_word.add_definition(test_definition)
      test_word.add_definition(test_definition2)
      expect(test_word.definitions()).to(eq([test_definition, test_definition2]))
    end

  end

  describe('#add_definition') do
    it("initially adds some data to a word's definitions array") do
      test_word = Word.new("Mouse")
      test_word.add_definition('a little furry mammal')
      expect(test_word.definitions()).to(eq(['a little furry mammal']))
    end

    it("adds an instance of a Definition object to a word's definitions array") do
      test_word = Word.new("Mouse")
      test_definition = Definition.new("a little furry mammal")
      test_word.add_definition(test_definition)
      expect(test_word.definitions()).to(eq([test_definition]))
    end
  end
end
