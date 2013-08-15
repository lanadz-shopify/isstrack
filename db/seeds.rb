# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1.upto(6) { |i| Department.create( {title: "Department #{i}"}, as: :seed) }
1.upto(10) { |i| User.create!({ email: "user#{i}@aa.com", password: "password_#{i}", name: "User #{i}" }) }
