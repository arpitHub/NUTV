# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

eric = User.create(first_name: 'Eric', last_name: 'Gift', email: 'giftsoccer14@gmail.com', password: 'EJG17141lns', password_confirmation: 'EJG17141lns', role: 'user')
bob = User.create(first_name: 'Bob', last_name: 'Boberson', email: 'giftsoccer12@gmail.com', password: 'EJG17141lns', password_confirmation: 'EJG17141lns', role: 'ep')

p1 = Project.create(name: "Martian Parody", user1: eric, user2: bob, dates: "1", status:"Completed", emailchain: [1])
p2 = Project.create(name: "Sports test", user1: eric, user2: bob, dates: "5/5/2016", status:"Completed", department:"entertainment")
Project.create(name: "For the Kids", user1: eric, user2: bob, dates: "5/5/2016", status:"Writing", department:"sports")
Project.create(name: "Test", user1: eric, user2: bob, dates: "5/5/2016", status:"Shooting", department: "news")
Project.create(name: "Test2", user1: eric, user2: bob, dates: "5/5/2016", status:"Editing")

