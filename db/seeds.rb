require "rest-client"
require "json"

def book_dataset
  response = RestClient.get("https://openlibrary.org/subjects/fiction.json?limit=100")
  data = JSON.parse(response.body)

  data["works"].each do |work|
    # Extract the first ISBN, if available
    isbn = work["isbn"]&.first
    
    # Extract author names if available
    authors = work["authors"]&.map { |author| author["name"] }&.join(", ")
    
    # Construct image URL if cover_id is available
    image_url = work["cover_id"] ? "https://covers.openlibrary.org/b/id/#{work["cover_id"]}-L.jpg" : nil
    
    Book.create(
      title: work["title"],
      author: authors,
      isbn: isbn,
      publication_date: work["first_publish_year"],
      genre: work["subject"]&.join(", "),  # Join genres as a string
      image_data: image_url,  # Use image_url
      url: "https://openlibrary.org#{work["key"]}"  # Full URL to the book
    )
  end
end

book_dataset()

