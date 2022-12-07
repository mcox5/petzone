# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Limpiando base de datos de perros"
Pet.destroy_all

puts "Creando Perros"
puts "..."
Pet.create({ name: "Oreo", breed: "border colie", birthday: "07/11/2019", gender: "female", weight: 20, allergies: "none", color: "black and white", chiped: false, specie: "dog", user_id: 1 })
Pet.create({ name: "Lara", breed: "Vizla", birthday: "07/11/2019", gender: "female", weight: 20, allergies: "none", color: "black and white", chiped: false, specie: "dog", user_id: 1 })
puts "Perros creados!"
