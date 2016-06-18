# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(login: "user", password: "password")

TaskStatus.create([
  {name: "To-do"},
  {name: "In Progress"},
  {name: "To Verify"},
  {name: "Done"}
])

PriorityType.create([
  {name: "High"},
  {name: "Medium"},
  {name: "Low"}
])
