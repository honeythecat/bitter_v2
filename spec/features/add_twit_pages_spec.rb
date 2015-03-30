require 'rails_helper'

describe "Log in and create a twit" do
  it "creates a new twit" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_on 'WRITE YOUR OWN TWIT!!'
    twit = FactoryGirl.create(:twit)
    expect(page).to have_content :twit
  end
end
