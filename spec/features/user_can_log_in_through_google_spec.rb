require 'rails_helper'

RSpec.describe "User Can Sign In And Out Through Google" do
  it "Sees that home Page with User name" do
    
    stub_omniauth

    visit '/'

    click_on "Login"

    expect(current_path).to eq login_path

    click_on "Sign In With Google"

    expect(current_path).to eq root_path
    expect(page).to have_content "homies@shelteredhomies.com"
    expect(page).to_not have_content "Login"

    click_on "Logout"

    expect(current_path).to eq root_path
    expect(page).to have_content "Login"
    expect(page).to_not have_content "homies@shelteredhomies.com"
  end
end