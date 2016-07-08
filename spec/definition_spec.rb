require('rspec')
require('definition')

describe('Definition') do

  describe('#phrase') do
    it('returns the string that constitutes a definition') do
      test_definition = Definition.new('a little furry mammal')
      expect(test_definition.phrase()).to(eq("a little furry mammal"))
    end
  end
end
