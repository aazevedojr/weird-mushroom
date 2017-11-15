require "rails_helper"

RSpec.feature "Visiting the About page" do
  scenario "User sees title for About" do
    visit "/static_pages/about"
    expect(page).to have_title ("WeirdMushroom | About")
  end
end
