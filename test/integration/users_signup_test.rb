require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid user information" do
    get signup_path

    assert_no_difference "User.count" do
      post users_path, params: {
        user: {
          name: "",
          email: "",
          password: "",
          password_confirmation: ""
        }
      }
    end
    assert_response :unprocessable_entity
    assert_template "users/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors", 6
  end

  test "valid user information" do
    get signup_path

    assert_difference "User.count", 1 do
      post users_path, params: {
        user: {
          name: "Mi Name",
          email: "my@email.com",
          password: "secret",
          password_confirmation: "secret"
        }
      }
    end
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
  end
end
