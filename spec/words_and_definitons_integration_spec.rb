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
    click_link('Submit')
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

  # it('populates and submits the word form and renders the index page showing the word') do
  #   visit('')
  #   expect_page([])
  # end
end
