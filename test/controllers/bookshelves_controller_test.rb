require "test_helper"

class BookshelvesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/bookshelves.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Bookshelf.count, data.length
  end

  test "create" do
    assert_difference "Bookshelf.count", 1 do
      post "/bookshelves.json", params: { name: "name_test", user_id: 1 }
      assert_response 200
    end
  end

  test "show" do
    get "/bookshelves/#{Bookshelf.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "user_id", "created_at", "updated_at"], data.keys
  end

  test "update" do
    bookshelf = Bookshelf.first
    patch "/bookshelves/#{bookshelf.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Bookshelf.count", -1 do
      delete "/bookshelves/#{Bookshelf.first.id}.json"
      assert_response 200
    end
  end
end
