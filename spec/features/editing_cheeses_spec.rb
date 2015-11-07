require "rails_helper"

RSpec.feature "Users can edit cheeses" do
  before do
    FactoryGirl.create(:cheese, name: "Challerhocker")

    visit "/"
    click_link "Challerhocker"
    click_link "Edit Cheese"
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
    click_button "Update Cheese"

    expect(page).to have_content "Cheese has been updated" 
    expect(page).to have_content "Description: Appenzeller"
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Cheese"

    expect(page).to have_content "Cheese has not been updated" 
  end 
end
