require "rails_helper"

RSpec.feature "Visiting the homepage" do
  scenario "User sees title for Home" do
    visit "/static_pages/home"
    expect(page).to have_title ("Home | Weird Mushroom")
  end
end
