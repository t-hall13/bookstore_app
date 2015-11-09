# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create!(first_name: 'Agatha', last_name: 'Christie')
Author.create!(first_name: 'Bram', last_name: 'Stoker')
Author.create!(first_name: 'E.', last_name: 'Motion')
Author.create!(first_name: 'Obie', last_name: 'Fernandez')
Author.create!(first_name: 'Cloves', last_name: 'Carneiro')
Author.create!(first_name: 'Rida', last_name: 'Al Barazi')

Publisher.create!([
  { name: 'Wiley' },
  { name: 'Addison Wesley' },
  { name: 'Peachpit Press' },
  { name: 'Manning Publications' },
  { name: 'McGraw-Hill' },
  { name: 'No-Starch Press' }
  ])
  
 Book.create!(title: 'Gnuplot in Action', isbn: '989-1-933-98839-9',
              page_count: 360, price: 66.37, description: 'A book on the 
              awesome opensource plotting software', published_at:'2010-11-04',
              publisher_id: 4, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/gnuplot.jpg')))
              
 Book.create!(title: 'Dracula', isbn: '989-1-933-98839-6',
              page_count: 500, price: 66.37, description: 'The one and only awesome Vampire tale', published_at:'2010-11-04',
              publisher_id: 4, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/Dracula_Book_Cover_1916.jpg')))
              
  Book.create!(title: 'Living Vicariously', isbn: '989-1-933-98849-9',
              page_count: 375, price: 61.37, description: 'A book about living vicarioulsy',
              published_at:'2010-11-04',
              publisher_id: 4, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/Living_Vicariously.jpg')))            
            
  Book.create!(title: 'The Sisters Brothers', isbn: '949-1-933-98839-9',
              page_count: 360, price: 66.37, description: 'A book about the sisters brothers', 
              published_at:'2010-11-04',
              publisher_id: 4, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/SistersBrothers.jpg')))
              
  Book.create!(title: 'None of Your Business', isbn: '989-1-953-98839-9',
              page_count: 360, price: 66.37, description: 'Don\'t you dare read this!', published_at:'2010-11-04',
              publisher_id: 4, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/none_of_your_business.gif')))
              
  Book.create!(title: 'This Book Has no Title', isbn: '989-1-933-98839-9',
              page_count: 360, price: 66.37, description: 'Maybe you can come up with one! Hey,
              let\'s hava a contest!', published_at:'2010-11-04',
              publisher_id: 4, 
              book_cover: File.open(File.join(Rails.root, 'app/assets/images/publication-187.jpg')))            