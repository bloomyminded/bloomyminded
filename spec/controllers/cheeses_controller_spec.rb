require 'rails_helper'

RSpec.describe CheesesController, type: :controller do
  it "handles a missing cheese properly" do
    get :show, id: "not-here"

    expect(response).to redirect_to(cheeses_path)

    expect(flash["alert"]).to eq "The cheese you were looking for could not be found." 
  end

end
