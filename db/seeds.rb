# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

###SEEDING USING ACTIVE INTERACTIONS
puts "### SEEDING USING ACTIVE INTERACTIONS"
verticals_json_records  = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'verticals.json')))
categories_json_records = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'categories.json')))
courses_json_records    = JSON.parse(File.read(Rails.root.join('lib', 'seeds', 'courses.json')))
verticals_json_records.each do |vertical|
  vertical_params = ActionController::Parameters.new({
    vertical: {
      name: vertical['Name'],
      categories_attributes: []
    }
  })
  puts "Seeded Vertical: #{vertical['Name']}"

  categories_json_records.each do |category|
    if category['Verticals'] == vertical['Id']
      vertical_params['vertical']['categories_attributes'] << {
        name:  category['Name'],
        state: category['State'],
        courses_attributes: []
      }
      puts "Seeded Vertical: #{category['Name']}"

      courses_json_records.each do |course|
        if course['Categories'] == category['Id']
          vertical_params['vertical']['categories_attributes'].last['courses_attributes'] << {
            name:   course['Name'],
            state:  course['State'],
            author: course['Author']
          }
          puts "Seeded Vertical: #{course['Name']}"
        end
      end
    end
  end
  Verticals::Create.run(params: vertical_params)
end

#Seeding Dummy User
puts "### Creating dummy user"
User.find_or_create_by!(email: "azan.abrar@gmail.com") do |user|
  user.password = "123#32!"
end


















