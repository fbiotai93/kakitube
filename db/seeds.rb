# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Genre.find_or_create_by(name: "Action", slug: "action")
Genre.find_or_create_by(name: "Adventure", slug: "adventure")
Genre.find_or_create_by(name: "Comedy", slug: "comedy")
Genre.find_or_create_by(name: "Documentary", slug: "documentary")
Genre.find_or_create_by(name: "Drama", slug: "drama")
Genre.find_or_create_by(name: "Family", slug: "family")
Genre.find_or_create_by(name: "Fantasy", slug: "fantasy")
Genre.find_or_create_by(name: "Horror", slug: "horror")
Genre.find_or_create_by(name: "Musical", slug: "musical")
Genre.find_or_create_by(name: "Romance", slug: "romance")
Genre.find_or_create_by(name: "Sci Fi", slug: "sci-fi")
Genre.find_or_create_by(name: "Thriller", slug: "thriller")

SiriGenre.find_or_create_by(name: "Romance", slug: "romance")
SiriGenre.find_or_create_by(name: "Europe", slug: "europe")
SiriGenre.find_or_create_by(name: "Latin", slug: "latin")
SiriGenre.find_or_create_by(name: "Malaysian", slug: "malaysian")
SiriGenre.find_or_create_by(name: "Asian", slug: "asian")