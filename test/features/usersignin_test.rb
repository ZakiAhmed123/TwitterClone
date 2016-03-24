require "test_helper"

class UserSignIn < Capybara::Rails::TestCase

  setup do
    User.create! name:"Sarah Khan", user_name:"_SK", email: "sarahkhan@gmail.com", password:"password"
end
test "Confirm Sign In" do

  visit root_path

  click_link "Sign In"
  fill_in "Email", with: "sarahkhan@gmail.com"
  fill_in "Password", with: "password"
  click_button "Welcome Back"
  assert_content page, "Sarah" 
end
end
