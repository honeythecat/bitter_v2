require 'rails_helper'

describe "user processes" do
  it "creates a new user" do
    visit "/"
    click_on 'SIGN UP'
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    fill_in 'Password confirmation', :with => '12345678'
    click_on "Sign up"
    expect(page).to have_content 'signed up successfully'
  end

  it "logs a user in" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'LOGIN'
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => '12345678'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  it "won't log in if password is missing" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => 'dog@world.com'
    fill_in 'Password', :with => ''
    click_on 'Log in'
    expect(page).to have_content 'Invalid email'
  end


end
