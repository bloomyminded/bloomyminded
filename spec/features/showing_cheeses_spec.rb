require "rails_helper"

RSpec.feature "Users can view cheeses" do
  scenario "with the cheese's details" do
    cheese = FactoryGirl.create(:cheese, name: "Challerhocker")

    visit "/"
    click_link "Challerhocker"
    expect(page.current_url).to eq cheese_url(cheese)
  end
end
