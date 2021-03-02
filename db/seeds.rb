# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Seeding Verticals from JSON
puts "### Started seeding Verticals"
verticals_json_records = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'verticals.json')))
verticals_json_records.each do |vertical|
  Vertical.find_or_create_by!(name: vertical["Name"])
  puts "Seeded Vertical: #{vertical["Name"]}"
end

#Seeding Categories from JSON
puts "### Started seeding Categories"
categories_json_records = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'categories.json')))
categories_json_records.each do |raw_category|
  Category.find_or_create_by!(name: raw_category["Name"]) do |category|
    category.vertical_id = Vertical.find_by(id: raw_category["Verticals"])&.id
    category.state = Category.states[raw_category["State"]]
  end
  puts "Seeded Vertical: #{raw_category["Name"]}"
end

#Seeding Courses from JSON
puts "### Started seeding Courses"
courses_json_records = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'courses.json')))
courses_json_records.each do |raw_course|
  Course.find_or_create_by!(
    name: raw_course["Name"],
    author: raw_course["Author"],
    category_id:  Category.find_by(id: raw_course["Categories"])&.id
    ) do |course|
    course.state = Course.states[raw_course["State"]]
  end
  puts "Seeded Vertical: #{raw_course["Name"]}"
end

#Seeding Dummy User
puts "### Creating dummy user"
User.find_or_create_by!(email: "azan.abrar@gmail.com") do |user|
  user.password = "123#32!"
end


















