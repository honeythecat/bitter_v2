require 'rails_helper'

describe "the add a twit process" do
  it "creates a new twit" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_on 'LOGIN'
    fill_in 'Email', :with => "dog@world.com"
    fill_in 'Password', :with => "12345678"
    click_on 'Log in'
    click_on 'WRITE YOUR OWN TWIT!!'
    fill_in 'Twit', :with => 'test twit'
    click_on 'Create Twit'
    expect(page).to have_content 'test twit'
  end

  it "gives error when no title is entered" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => "dog@world.com"
    fill_in 'Password', :with => "12345678"
    click_on 'Log in'
    click_on 'WRITE YOUR OWN TWIT!!'
    fill_in 'Twit', :with => ''
    click_on 'Create Twit'
    expect(page).to have_content 'ERRORS!!'
  end


end
