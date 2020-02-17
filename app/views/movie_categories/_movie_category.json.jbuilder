json.extract! movie_category, :id, :name, :created_at, :updated_at
json.url movie_category_url(movie_category, format: :json)
