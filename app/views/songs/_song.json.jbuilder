json.extract! song, :id, :title, :duration, :disc, :style, :created_at, :updated_at
json.url song_url(song, format: :json)
