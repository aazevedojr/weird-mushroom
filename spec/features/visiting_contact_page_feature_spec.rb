require "rails_helper"

RSpec.feature "Visiting the Contact page" do
  scenario "User sees title for Contact" do
    visit "/static_pages/contact"
    expect(page).to have_title ("WeirdMushroom | Contact")
  end
end
