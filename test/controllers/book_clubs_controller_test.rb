require "test_helper"

class BookClubsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/book_clubs.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal BookClub.count, data.length
  end

  test "create" do
    assert_difference "BookClub.count", 1 do
      post "/book_clubs.json", params: { user_id: 1, name: "name_test", description: "description_test" }
      assert_response 200
    end
  end

  test "show" do
    get "/book_clubs/#{BookClub.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "name", "description", "created_at", "updated_at"], data.keys
  end

  test "update" do
    book_club = BookClub.first
    patch "/book_clubs/#{book_club.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "BookClub.count", -1 do
      delete "/book_clubs/#{BookClub.first.id}.json"
      assert_response 200
    end
  end
end
