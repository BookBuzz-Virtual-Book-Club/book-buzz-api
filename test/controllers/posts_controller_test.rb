require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/posts.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Post.count, data.length
  end

  test "create" do
    assert_difference "Post.count", 1 do
      post "/posts.json", params: { discussion_board_id: 1, user_id: 1, content: "test_content" }
      assert_response 200
    end
  end

  test "show" do
    get "/posts/#{Post.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "discussion_board_id", "user_id", "content", "created_at", "updated_at"], data.keys
  end

  test "update" do
    post = Post.first
    patch "/posts/#{post.id}.json", params: { content: "Updated content" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated content", data["content"]
  end

  test "destroy" do
    assert_difference "Post.count", -1 do
      delete "/posts/#{Post.first.id}.json"
      assert_response 200
    end
  end
end
