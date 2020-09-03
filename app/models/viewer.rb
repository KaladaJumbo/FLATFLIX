class Viewer
  attr_reader :username

  @@all = []

  def initialize(username)
    @username = username
    self.class.all << self
    
  end

  def self.all
    @@all
  end

  def reviews

    Review.all.select do |int_review|

      int_review.viewer == self

    end

  end

  def reviewed_movies

    self.reviews.map do |int_review|

      int_review.movie
      #take all reviews owned by calling reviews and 
      #returning an arr of movies in those reviews

    end

  end

  def reviewed_movie?(movie)

    self.reviewed_movies.include?(movie)

  end

  def rate_movie(movie, rating)

    if !self.reviewed_movie?(movie)
      new_review = Review.new(self, movie, rating)
      return new_review
    else 
      new_review = self.reviews.find do |int_review|
        int_review.movie == movie
      end
      new_review.rating = rating
      return new_review
    end

  end
  
end
