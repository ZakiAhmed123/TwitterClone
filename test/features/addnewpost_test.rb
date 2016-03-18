require "test_helper"

class AddNewPost < Capybara::Rails::TestCase

  setup do
    User.create! name: "Chris Joya", user_name: "C_money", email:"chrisjoya@gmail.com", password:"password"
end

test "Can Add New Post" do 

end
end
