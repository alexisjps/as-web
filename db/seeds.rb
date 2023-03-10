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

Ticket.destroy_all

test_user = User.find_by(email: 'test@test.com')
if test_user != nil
    test_user.destroy
end

sanofi = Client.find_by(email: 'contact@sanofi.fr')
if sanofi != nil
    sanofi.destroy
end

puts 'Clean ok'
sleep(1)
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
alexis = User.create!(first_name: 'Alexis', last_name: "Stephan", email: 'test@test.com', password: '123456', siret: "123456789", phone: '0646820375', address: '12 rue lesueur Paris')
sleep(1)
p 'client creating'
Client.create!(first_name: 'Sanofi', last_name: "LTD", email: 'contact@sanofi.fr', phone: '0145949394', compagny_address: '46 AV DE LA GRANDE ARMEE 75017 PARIS', compagny_siret: '395030844', user_id: alexis.id)
puts 'user created'