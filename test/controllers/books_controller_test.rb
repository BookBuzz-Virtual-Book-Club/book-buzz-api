require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/books.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Book.count, data.length
  end

  test "create" do
    assert_difference "Book.count", 1 do
      post "/books.json", params: { title: "title_test", author: "author_test", isbn: "isbn_test", publication_date: "2024-12-05", genre: "genre_test" }
      assert_response 200
    end
  end

  test "show" do
    get "/books/#{Book.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "author", "isbn", "publication_date", "genre", "created_at", "updated_at"], data.keys
  end

  test "update" do
    book = Book.first
    patch "/books/#{book.id}.json", params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

  test "destroy" do
    assert_difference "Book.count", -1 do
      delete "/books/#{Book.first.id}.json"
      assert_response 200
    end
  end
end
