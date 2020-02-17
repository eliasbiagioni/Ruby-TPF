json.extract! book, :id, :title, :isbn, :author, :editorial, :summary, :created_at, :updated_at
json.url book_url(book, format: :json)
