require "rails_helper"

RSpec.feature "Visiting the Contact page" do
  scenario "User sees title for Contact" do
    visit "/static_pages/about"
    expect(page).to have_title ("Contact | Weird Mushroom")
  end
end
