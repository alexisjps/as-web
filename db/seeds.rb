# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
puts 'Clean database'
Lorum.destroy_all
test_user = User.find_by(email: 'test@test.com')
test_user.destroy
puts 'Clean ok'
sleep(2)
puts 'Create lorums ipsum texting'
numero = 1
200.times do
    numero += 1
    Lorum.create!(
        paragraphe: Faker::Lorem.paragraph_by_chars(number: (numero * 100), supplemental: false),
        number: numero
    )
end
puts 'Lorum ipsum created'
puts 'user creating'
User.create!(first_name: 'Alexis', last_name: "Stephan", email: 'test@test.com', password: '123456', siret: "123456789", phone: '0646820375', address: '12 rue lesueur Paris')
puts 'user created'