class Movie
  attr_reader :title

  @@all = []

  def initialize(title)
    @title = title
    self.class.all << self
    
  end

  def self.all
    @@all
  end

  def reviews

    Review.all.select do |int_review|

      int_review.movie == self

    end

  end

  def viewers

    self.reviews.map do |int_review|

      int_review.viewer

    end

  end

  def average_rating

    sum = 0
    average = 0

    sum = self.reviews.sum do |int_review|

      int_review.rating

    end

    if sum.class != Integer 
      sum = 0 
      #here to catch empty date being passed as nil
    end

    average = sum.to_f / self.reviews.length

    return average

  end

  def self.rated_movies  
    
    #helper method to make sure only rated movies(instances that have a join table) are
    #interacting with instances that use methods that call 
    #the joing table
    Movie.all.select do |int_movie|
      
      int_movie.reviews.length >= 1


    end

  end

  def self.highest_rated
    
    Movie.rated_movies.max_by do |int_movie| 

      int_movie.average_rating

    end

  end

end
