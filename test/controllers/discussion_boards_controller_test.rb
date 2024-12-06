require "test_helper"

class DiscussionBoardsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/discussion_boards.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal DiscussionBoard.count, data.length
  end

  test "create" do
    assert_difference "DiscussionBoard.count", 1 do
      post "/discussion_boards.json", params: { name: "discussion_board_name", book_club_id: 1 }
      assert_response 200
    end
  end

  test "show" do
    get "/discussion_boards/#{DiscussionBoard.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "book_club_id", "created_at", "updated_at"], data.keys
  end

  test "update" do
    discussion_board = DiscussionBoard.first
    patch "/discussion_boards/#{discussion_board.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data ["name"]
  end

  test "destroy" do
    assert_difference "DiscussionBoard.count", -1 do
      delete "/discussion_boards/#{DiscussionBoard.first.id}.json"
      assert_response 200
    end
  end

end
