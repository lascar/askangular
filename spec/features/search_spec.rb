require 'spec_helper.rb'

feature "Looking up elements", js: true do
  scenario "finding element" do
    visit '/'
    fill_in "keywords", with: "3"
    click_on "Search"

    expect(page).to have_content("Element 3")
  end
end
