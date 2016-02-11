require "rails_helper"

RSpec.feature "Users can create new cheeses" do
  before do 
    visit "/"
    click_button "New Cheese"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Challerhocker"
    fill_in "Producer", with: "Kaserei Tufertschwil"
    select "Switzerland", from: "Country of origin"
    fill_in "Region of origin", with: "Canton of St. Gallen"
    fill_in "Milk", with: "Raw Cow"
    fill_in "Rind", with: "Washed"
    fill_in "Rennet", with: "Animal"
    fill_in "Texture", with: "Firm"
    fill_in "Age", with: "10 months"
    fill_in "Description", with: "Appenzeller"
    click_button "Create Cheese"

    expect(page).to have_content "Cheese has been added!"
  end

  scenario "with invalid attributes" do
    click_button "Create Cheese"

    expect(page).to have_content "Cheese has not been added!"
  end
end
