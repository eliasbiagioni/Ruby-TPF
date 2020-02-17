class AddRelations < ActiveRecord::Migration[5.2]
    def change
        
        create_table :songs_categories do |t|
            t.belongs_to :song, index: true
            t.belongs_to :music_category, index: true
          
            t.timestamps
        end

        create_join_table :music_categories, :music_discs do |t|
            t.index [:music_category_id, :music_disc_id], :name => 'index_join_music_d_categories'
        end

        create_join_table :book_categories, :books do |t|
            t.index [:book_category_id, :book_id], :name => 'index_join_book_categories'
        end

        create_join_table :movie_categories, :movies do |t|
            t.index [:movie_category_id, :movie_id], :name => 'index_join_movie_categories'
        end

        create_join_table :music_discs, :songs do |t|
            t.index [:music_disc_id, :song_id], :name => 'index_join_music_discs'
        end

        create_join_table :catalogs, :books do |t|
            t.index [:catalog_id, :book_id], :name => 'index_join_catalogs_books'
        end

        create_join_table :catalogs, :movies do |t|
            t.index [:catalog_id, :movie_id], :name => 'index_join_catalogs_movies'
        end

        create_join_table :catalogs, :music_discs do |t|
            t.index [:catalog_id, :music_disc_id], :name => 'index_join_catalog_music_disc'
        end

        add_reference :catalogs, :catalog_category, foreign_key: true
        add_reference :catalogs, :user, foreign_key: true
        add_reference :songs, :music_category, foreign_key: true
    end
  end