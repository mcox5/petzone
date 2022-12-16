# 1: Crear Users (3 Usuarios distintos)
require "open-uri"
puts "creando usuarios"

User.create(
  email: "mcox5@uc.cl",
  password: "123456",
  username: "Matias"
)
User.create(
  email: "tomasmcasey@gmail.com",
  password: "123456",
  username: "Tomi"
)
puts "Usuarios creados"
# 2: Crear Pets (10 pets)
puts "Creando Perros..."

lara = Pet.new(
  name: "Lara",
  breed: "Vizla",
  birthday: "2020-07-13",
  gender: "Hembra",
  weight: 20,
  spayed: true,
  allergies: "alergia a los ojos",
  color: "cafe claro",
  chiped: true,
  specie: "dog",
  user_id: 1
)
foto_lara = File.open(Rails.root.join(("app/assets/images/Foto Lara.jpg")))
lara.photos.attach(io: foto_lara, filename: "nes.png", content_type: "image/jpg" )
lara.save!

donald = Pet.new(
  name: "Donald",
  breed: "Bichon Frise",
  birthday: "2006-12-21",
  gender: "Macho",
  weight: 8,
  spayed: false,
  allergies: "ninguna",
  color: "blanco",
  chiped: false,
  specie: "dog",
  user_id: 1
)
foto_donald = File.open(Rails.root.join(("app/assets/images/Donald.JPG")))
donald.photos.attach(io: foto_donald, filename: "nes.png", content_type: "image/jpg" )
donald.save!
# 10.times do
#   file = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/c2/Australianshepherd01.jpg")
#   pet = Pet.new(
#     name: Faker::Creature::Dog.name,
#     breed: Faker::Creature::Dog.breed,
#     birthday: Faker::Date.between(from: '2014-09-23', to: '2021-09-25'),
#     gender: Faker::Creature::Dog.gender,
#     weight: Faker::Number.between(from: 1, to: 25),
#     spayed: Faker::Boolean.boolean,
#     allergies: "none",
#     color: "negro con manchas blancas",
#     specie: "dog",
#     user_id: rand(1..2)
#   )

#   pet.photos.attach(io: file, filename: "nes.png", content_type: "image/jpg" )

#   pet.save!
# end


puts "Perros creados"
# 3: Crear tratamientos (3 tratamientos)


# 4: Crear appointments (20 appointments)
puts "creando Appointments"
20.times do
  appointment = Appointment.new(
    veterinary_name: Faker::Company.name,
    doctor_name: Faker::Name.name,
    pet_id: rand(1..2),
    date: Faker::Date.between(from: '2021-02-23', to: '2022-5-23')
  )
  appointment.save!
end
puts "Appointments creados!"
puts "....."


# -----------------------------------
# 5.1: Crear 5 Vacunas
puts "creando 5 vacunas para lara y donald"
vaccine_name = ["vacuna parvovirosis", "vacuna moquillo", "vacuna polivalentes", "vacuna Rabia", "vacuna Leptospirosis"]

vaccine_name.each do |vaccine|
  new_vaccine = Vaccine.new(
    name: vaccine,
    interval: [120, 150, 90].sample,
    date: Faker::Date.between(from: '2022-11-23', to: '2022-08-23'),
    pet_id: 1
  )
  new_vaccine.save!
  new_vaccine_2 = Vaccine.new(
    name: vaccine,
    interval: [120, 150, 90].sample,
    date: Faker::Date.between(from: '2022-11-23', to: '2022-08-23'),
    pet_id: 2
  )
  new_vaccine_2.save!
end

puts "creadas las 5 vacunas"


# 5.2: Crear 5 Desparacitaciones
puts "creando 5 desparasitantes"
deworming_name = ["desparasitante parvovirosis", "desparasitante moquillo", "desparasitante polivalentes", "desparitante Rabia", "desparitante Leptospirosis"]
deworming_name.each do |deworming|
  new_deworming = Deworming.new(
    name: deworming,
    interval: rand(3..100),
    date: Faker::Date.between(from: '2021-02-23', to: '2021-11-23'),
    pet_id: rand(1..2)
  )
  new_deworming.save!
end
puts "creadas las 5 desparacitantes"
