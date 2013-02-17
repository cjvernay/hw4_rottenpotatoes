class Movie < ActiveRecord::Base

  def self.find_in_movies(string)
    Movie.where(["director = ?", string])
  end

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
end
