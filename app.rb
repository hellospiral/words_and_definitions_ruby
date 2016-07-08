require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

get('/words/new') do
  erb(:word_form)
end

post('/words') do
  name = params.fetch('name')
  Word.new(name).save()
  @words = Word.all()
  erb(:index)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/definitions') do
  phrase = params.fetch('definition')
  new_definition = Definition.new(phrase)
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(new_definition)
  erb(:word)
end
