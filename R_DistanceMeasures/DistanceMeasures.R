#title: "R code snippets for various distance measures e.g. Euclidean and Manhattan"
#author: "Julian Kanjere"
#date: "October 2019"

#Euclidean distance
#Euclidean distance or Euclidean metric is the "ordinary" straight-line distance between two points in Euclidean space.
#FYI Euclidean distance for 2 dimensions is similar to Pythagoras' theorem - It states that the area of the square whose side is the hypotenuse (side opposite the right angle) is equal to the sum of the areas of the squares on the other two sides.
#Pythagoras' theorem can be written as an equation relating the lengths of the sides a, b and c: a^2 + b^2 = c^2 where c represents the length of the hypotenuse and a and b the lengths of the triangle's other two sides.
#Euclidean distance - think of flying between two cities, you fly directly (i.e. along hypotenuse)  ot along the two edges
#Euclidean distance implementation below
sum_i_to_n <- 0
n <- 2 #number of dimensions
q <- c(1,3) #i.e. 2 dimensions, coordinate for q is x, y
p <- c(2,5) #i.e. 2 dimensions, coordinate for q is x, y
for (i in 1:n){
  # i is the current dimension we are looking at
  sum_i = (q[i] - p[i])^2
  sum_i_to_n = sum_i_to_n + sum_i
}
euclidean_dist = sqrt(sum_i_to_n)
euclidean_dist

#Manhattan distance
#Manhattan distance - the distance between two points is the sum of the absolute differences of their Cartesian coordinates i.e. in the case of a triangle instead of the hypotenuse (c) which is the euclidean distance, you get the sum of the absolute values of a and b.
#It is called the Manhattan distance because it is the distance a car would drive in a city (e.g., Manhattan) where the buildings are 
#laid out in square blocks and the straight streets intersect at right angles. This explains the other terms City Block and taxicab distances.
sum_i_to_n <- 0
n <- 2 #number of dimensions
q <- c(1,3) #i.e. 2 dimensions, coordinate for q is x, y
p <- c(2,5) #i.e. 2 dimensions, coordinate for q is x, y
for (i in 1:n){
  # i is the current dimension we are looking at
  sum_i = abs(q[i] - p[i])
  sum_i_to_n = sum_i_to_n + sum_i
}
manhattan_dist = sum_i_to_n
manhattan_dist