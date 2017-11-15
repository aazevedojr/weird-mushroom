require "rails_helper"

RSpec.feature "Visiting the homepage" do
  scenario "User sees title for Home" do
    visit "/static_pages/home"
    expect(page).to have_title ("WeirdMushroom | Home")
  end
end
