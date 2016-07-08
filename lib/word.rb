class Word
  @@words = []

  define_method(:initialize) do |name|
    @name = name
    @id = @@words.length() + 1
    @definitions = []
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:id) do
    @id
  end

  define_method(:name) do
    @name
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end
end
