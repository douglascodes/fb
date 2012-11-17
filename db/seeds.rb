# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({:id => 1, :name => "Douglas", :email => "douglasdrinks@gmail.com", :points => 1000 })
User.create({:id => 2,:name => "Bipen", :email => "bipen@lokalty.com", :points => 3333 })
User.create({:id => 3, :name => "Nico", :email => "dhk_potables@hotmail.com", :points => 4444 })
User.create({:id => 4,:name => "Balu Chand", :email => "balu@lokalty.com", :points => 222 })
User.create({:id => 5,:name => "Rebecca Strupp", :email => "special@lokalty.com", :points => 553 })
Gift.create({:title => "Happy Thxgiving", :amount => 100, :sender_id => 1, :receiver_id => 2 })
Gift.create({:title => "Happy Birthday", :amount => 222, :sender_id => 3, :receiver_id => 1 })
Gift.create({:title => "Happy Chanuka", :amount => 77, :sender_id => 2, :receiver_id => 1 })
