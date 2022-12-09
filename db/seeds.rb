# 1: Crear Users (3 Usuarios distintos)
require "open-uri"
puts "creando usuarios"

User.create(
  email: "mcox5@uc.cl",
  password: "123456"
)
User.create(
  email: "tomasmcasey@gmail.com",
  password: "123456"
)
puts "Usuarios creados"
# 2: Crear Pets (10 pets)
puts "Creando Perros..."
10.times do
  file = URI.open("https://upload.wikimedia.org/wikipedia/commons/c/c2/Australianshepherd01.jpg")
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    breed: Faker::Creature::Dog.breed,
    birthday: Faker::Date.between(from: '2014-09-23', to: '2021-09-25'),
    gender: Faker::Creature::Dog.gender,
    weight: Faker::Number.between(from: 1, to: 25),
    spayed: Faker::Boolean.boolean,
    allergies: "none",
    color: "negro con manchas blancas",
    specie: "dog",
    user_id: rand(1..2)
  )
  pet.photos.attach(io: file, filename: "nes.png", content_type: "image/jpg" )
  pet.save!
end


puts "Perros creados"
# 3: Crear tratamientos (3 tratamientos)
puts "Creando tratamientos..."
3.times do
  treatment = Treatment.new(
    name: ["alergia al platano", "artrosis", "ceguera"].sample,
    last_application: Faker::Date.between(from: '2022-11-23', to: '2022-11-30'),
    interval: rand(3..10),
    pet_id: rand(1..10)
  )
  treatment.save!
end
puts "Tratamientos creados"

# 4: Crear appointments (20 appointments)
puts "creando Appointments"
20.times do
  appointment = Appointment.new(
    veterinary_name: Faker::Company.name,
    doctor_name: Faker::Name.name,
    pet_id: rand(1..10)
  )
  appointment.save!
end
puts "Appointments creados!"
puts "....."


# -----------------------------------
# 5.1: Crear 5 Vacunas
puts "creando 5 vacunas"
vaccine_name = ["vacuna parvovirosis", "vacuna moquillo", "vacuna polivalentes", "vacuna Rabia", "vacuna Leptospirosis"]

vaccine_name.each do |vaccine|
  new_vaccine = Vaccine.new(
    name: vaccine,
    interval: rand(3..10)
  )
  new_vaccine.save!
end

puts "creadas las 5 vacunas"


# 5.2: Crear 5 Desparacitaciones
puts "creando 5 desparasitantes"
deworming_name = ["desparasitante parvovirosis", "desparasitante moquillo", "desparasitante polivalentes", "desparitante Rabia", "desparitante Leptospirosis"]
deworming_name.each do |deworming|
  new_deworming = Deworming.new(
    name: deworming,
    interval: rand(3..10)
  )
  new_deworming.save!
end
puts "creadas las 5 desparacitantes"

# 5.3: Crear  examenes
puts "creando 5 examenes"
exams_name = ["pata de atras", "nariz", "oreja", "ecografía", "radiografía de mano"]
exams_name.each do |exam|
  new_exam = Exam.new(
    name: exam,
    description: "Radiografía tomada por precaución"
  )
  new_exam.save!
end

# 6: Crear applies (20 applies)
puts "creando aplicaciones de vacunas, examenes y desparacitaciones"
20.times do
  apply = Apply.new(
    date: Faker::Date.between(from: '2022-02-23', to: '2022-11-30'),
    vaccine_id: rand(1..5),
    deworming_id: rand(1..5),
    exam_id: rand(1..5),
    appointment_id: rand(1..20)
  )
  apply.save!
end
