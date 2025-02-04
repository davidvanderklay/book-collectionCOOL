# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.create(
  title: 'The Lord of the Rings',
  author: 'J.R.R. Tolkien',
  price: 14.99,
  published_date: Date.new(1954, 7, 29)
)

Book.create(
  title: "The Hitchhiker's Guide to the Galaxy",
  author: 'Douglas Adams',
  price: 9.99,
  published_date: Date.new(1979, 10, 12)
)

Book.create(
  title: 'Pride and Prejudice',
  author: 'Jane Austen',
  price: 7.99,
  published_date: Date.new(1813, 1, 28)
)

Book.create(
  title: 'To Kill a Mockingbird',
  author: 'Harper Lee',
  price: 10.99,
  published_date: Date.new(1960, 7, 11)
)

Book.create(
  title: 'The Great Gatsby',
  author: 'F. Scott Fitzgerald',
  price: 8.99,
  published_date: Date.new(1925, 4, 10)
)
