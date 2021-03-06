require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

def expect_page(arr)
  arr.each() do |element|
    expect(page).to have_content(element)
  end
end

describe('the root path', {:type => :feature}) do
  it('renders the index page') do
    visit('/')
    expect_page(['Dictionary!', 'Add a Word!'])
  end

  it('lists words if they exist') do
    test_word = Word.new('Idea')
    test_word.save()
    visit('/')
    expect_page(['Dictionary!', 'Add a Word!', 'Idea'])
  end
end

describe('the word form path', {:type => :feature}) do
  it('accesses the word form from the index page') do
    visit('/')
    click_link('Add a Word!')
    expect_page(['Add a word', 'Submit'])
  end

  it('populates and submits the word form and renders the index page showing the word') do
    visit('/')
    click_link('Add a Word!')
    fill_in('name', :with => 'Idea')
    click_button('Submit')
    expect_page(['Dictionary!', 'Add a Word!', 'Idea'])
  end
end

describe('the view word path', {:type => :feature}) do
  it('views page for a specific word') do
    test_word = Word.new('Man')
    test_word.save()
    visit('/')
    click_link('Man')
    expect_page(['Man'])
  end

  it("lists a specific word's definitions if they exist") do
    test_word = Word.new('Woman')
    test_word.save()
    test_definition = Definition.new('a female homo sapien')
    test_word.add_definition(test_definition)
    visit('/')
    click_link('Woman')
    expect_page(['Woman', 'a female homo sapien'])
  end
end

describe('the create definition path', {:type => :feature}) do
  it('adds a definition to a word') do
    test_word = Word.new('Meaning')
    test_word.save()
    visit('/')
    click_link('Meaning')
    fill_in('definition', :with => "a feeling of purpose")
    click_button('Submit')
    expect_page(['Meaning', "a feeling of purpose", 'Add a definition to Meaning'])
  end
end
