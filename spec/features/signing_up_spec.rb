require "rails_helper"

RSpec.feature "Users can sign up" do
  before do
    visit "/"
    click_link "Sign Up"
  end

  pending "when providing valid details"
end
