require "test_helper"

class UserBooksControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/user_books.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal UserBook.count, data.length
  end

  test "create" do
    assert_difference "UserBook.count", 1 do
      post "/user_books.json", params: { user_id: 1, book_id: 1, bookshelf_id: 1, rating: 5, review: "Amazing" }
      assert_response 200
    end
  end

  test "show" do
    get "/user_books/#{UserBook.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "book_id", "bookshelf_id", "rating", "review", "created_at", "updated_at"], data.keys
  end

  test "update" do
    user_book = UserBook.first
    patch "/user_books/#{user_book.id}.json", params: { review: "Updated review" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated review", data["review"]
  end

  test "destroy" do
    assert_difference "UserBook.count", -1 do
      delete "/user_books/#{UserBook.first.id}.json"
      assert_response 200
    end
  end
end
