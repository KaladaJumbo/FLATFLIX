class Review

    attr_reader :rating, :movie, :viewer
    attr_writer :rating
    
    @@all = []

    def initialize (viewer, movie, rating)

        @viewer = viewer
        @movie = movie
        @rating = rating
        Review.all << self

    end

    def self.all

        @@all 

    end


end
