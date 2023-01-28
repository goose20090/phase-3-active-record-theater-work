puts "🌱 Seeding spices..."


2.times do 
    Role.create(character_name: Faker::TvShows::GameOfThrones.character)
end 
# Seed your database here
10.times do
    audition = Audition.create(
        actor: Faker::Name.name,
        location: Faker::Address.city,
        phone: Faker::PhoneNumber.cell_phone,
        hired: false,
        role_id: Role.pluck(:id).sample
    )
end 
puts "✅ Done seeding!"
