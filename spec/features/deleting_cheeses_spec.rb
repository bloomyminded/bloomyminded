require "rails_helper"

RSpec.feature "Users can delete cheeses" do
  scenario "sucessfully" do
    FactoryGirl.create(:cheese, name: "Challerhocker")

    visit "/"
    click_link "Challerhocker"
    click_link "Delete Cheese"

    expect(page).to have_content "Cheese has been deleted."
    expect(page.current_url).to eql cheeses_url
    expect(page).to have_no_content "Challerhocker"
  end
end
