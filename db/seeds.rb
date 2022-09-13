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
puts 'Clean ok'
sleep(2)
puts 'Create lorums ipsum texting'
200.times do
Lorum.create!(
    paragraphe: Faker::Lorem.paragraph,
    number: (1..200).to_a.sample
)
end
puts 'Lorum ipsum created'