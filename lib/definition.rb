class Definition

  define_method(:initialize) do |phrase|
    @phrase = phrase
  end

  define_method(:phrase) do
    @phrase
  end
end
