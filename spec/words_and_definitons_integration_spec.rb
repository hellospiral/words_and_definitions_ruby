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
end