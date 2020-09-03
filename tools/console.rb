# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

############ data begins #############

movie1 = Movie.new("movie1")
movie2 = Movie.new("movie2")
movie3 = Movie.new("movie3")
movie4 = Movie.new("movie4")

viewer1 = Viewer.new("viewer1")
viewer2 = Viewer.new("viewer2")
viewer3 = Viewer.new("viewer3")
viewer4 = Viewer.new("viewer4")
viewer5 = Viewer.new("viewer5")


review1 = Review.new(viewer1, movie1, 10)
review2 = Review.new(viewer2, movie1, 5)
review3 = Review.new(viewer3, movie2, 7)
review4 = Review.new(viewer4, movie3, 1)
review5 = Review.new(viewer4, movie1, 3)


############    data ends ##################

############    testing begains  ##################

############    review class testing ##################

puts "review class testing \n\n"
puts "review initialize and .all -- exp 5 "
puts Review.all
p Review.all.length
puts "review class include review3?"
puts Review.all.include?(review3)
puts "test review2 getters -- exp viewer = viewer2, movie = movie1, rating = 5"
p review2.viewer
p review2.movie
puts review2.rating
puts "\n\n"

puts "viewer class testing"
puts "testing intialize and all method --- exp 5 "
puts Viewer.all
puts Viewer.all.length
puts "viewer class include viewer3?"
puts Viewer.all.include?(viewer2)
puts "all reviews by viewer4 -- exp 2"
puts viewer4.reviews
puts viewer4.reviews.length
puts "reviewed movies by viewer4  - exp 2"
p viewer4.reviewed_movies
puts viewer4.reviewed_movies.length
puts "has viewer1 reviewed movie4 -- exp false?"
puts viewer1.reviewed_movie?(movie4)
puts "testing rate movie"
puts "viewer5 rating movie4"
p viewer5.rate_movie(movie4, 1000000)
puts "rating movie 4 again"
p viewer5.rate_movie(movie4, 10)
puts "movie 4 reviews"
p movie4.reviews
puts "\n\n"

puts "testing movie class"
puts "movie intialize and all method testing -- exp 4"
puts Movie.all
puts Movie.all.length
puts "reviews for movie1 -- exp 3"
p movie1.reviews
puts movie1.reviews.length
puts "viewers for movie2 -- exp 1, viewer3"
p movie2.viewers
puts "testing average review for movie1 -- exp 6"
puts movie1.average_rating
puts "highest average rating movie exp -- movie2"
p Movie.highest_rated
puts "\n\n"



############    review class testing ##################





# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
0
