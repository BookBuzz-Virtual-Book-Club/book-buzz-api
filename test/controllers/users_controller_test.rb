require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/users.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal User.count, data.length
  end

  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { username: "username_test", image_data: "image_data_here", email: "test_email", password_digest: "password" }
      assert_response 200
    end
  end

  test "show" do
    get "/users/#{User.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "username", "image_data", "email", "password_digest", "created_at", "updated_at"], data.keys
  end

  test "update" do
    user = User.first
    patch "/users/#{user.id}.json", params: { username: "Updated username" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated username", data["username"]
  end

  test "destroy" do
    assert_difference "User.count", -1 do
      delete "/users/#{User.first.id}.json"
      assert_response 200
    end
  end
end
