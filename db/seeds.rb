# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(:name => 'Michael', :email => 'wynk182@gmail.com', :birth_date => Date.parse('Aug 21 1989'))
User.create(:name => 'test', :email => 'test@test.com', :birth_date => Date.parse('Aug 21 1999'))