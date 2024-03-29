require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
    name  = "Example User"
    email = "user@example.com"
    password = "password"
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  name,
                                            email: email,
                                            password:              password,
                                            password_confirmation: password }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
