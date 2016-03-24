require "test_helper"

class UserSignUp < Capybara::Rails::TestCase

  setup do
    User.create! name: "Nash", user_name:"NashSucks", email: "IhateNashForShowingMeSharkTank", password:"fucknash"
end
test "Confirm Sign Up" do

  visit root_path

  click_link "Sign Up"
  fill_in "Name", with: "Nash"
  fill_in "User Name", with: "NashSucks"
  fill_in "Email", with: "IhateNashForShowingMeSharkTank"
  fill_in "Password", with: "fucknash"
  click_button "Sign Up"
  assert_content page, "Nash"
end
end
