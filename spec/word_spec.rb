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
  end
end
