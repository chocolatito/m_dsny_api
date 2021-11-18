class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :movie_or_serie
      t.string :url_picture
      t.string :title
      t.date :debut_date
      t.date :score

      t.timestamps
    end
  end
end
