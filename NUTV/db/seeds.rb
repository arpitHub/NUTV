# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Project.create(name: "Martian Parody", director: "Amaan Udhas", ep: "Eric Gift", equipment: "5D, Shotgun Mic", dates: "1", status:"Completed")
p2 = Project.create(name: "Sports test", director: "Tim McQuaid", ep: "Eric Gift", equipment: "5D, Shotgun Mic", dates: "5/5/2016", status:"Completed")
Project.create(name: "For the Kids", director: "Tim McQuaid", ep: "Eric Gift", equipment: "5D, Shotgun Mic", dates: "5/5/2016", status:"Writing")
Project.create(name: "Test", director: "Tim McQuaid", ep: "Eric Gift", equipment: "5D, Shotgun Mic", dates: "5/5/2016", status:"Shooting")
Project.create(name: "Test2", director: "Tim McQuaid", ep: "Eric Gift", equipment: "5D, Shotgun Mic", dates: "5/5/2016", status:"Editing")

Event.create(startminute: 1, endhour: 20, endminute:10, day: 15, month: 3, year: 2016, project_id: p1.id)
Event.create(startminute: 1, endhour: 20, endminute:10, day: 15, month: 3, year: 2016, project_id: p2.id)
