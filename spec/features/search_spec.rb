require 'spec_helper.rb'

feature "Looking up elements", js: true do
  before do
    Element.create!(name: 'Element 1')
    Element.create!(name: 'Element 2')
    Element.create!(name: 'Element 3')
    Element.create!(name: 'Element 4')
  end

  scenario "finding element" do
    visit '/'
    fill_in "keywords", with: "3"
    click_on "Search"

    expect(page).to have_content("Element 3")
  end
end
