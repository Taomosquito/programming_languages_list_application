# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Starting to seed..."
  # Array of languages from different stacks
  languages = [
    # One from the C stack
    { title: "C", description: "A general-purpose, procedural programming language that has influenced many other modern languages.", link: "https://devdocs.io/c/" },
    
    # One from the Standard Web Stack
    { title: "JavaScript", description: "A versatile programming language that runs in the browser and on servers.", link: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide" },
    
    # One from Object-Oriented Programming (OOP)
    { title: "Ruby", description: "A dynamic, open-source programming language with a focus on simplicity and productivity.", link: "https://www.ruby-lang.org/en/documentation/" },
    
    # One from Systems Programming
    { title: "Go", description: "A statically typed, compiled language designed for simplicity and efficiency.", link: "https://golang.org/doc/" }
  ]

  # Iterate over the languages array and create each record in the Resource model
  languages.each do |language|
    Resource.find_or_create_by(title: language[:title]) do |resource|
      resource.description = language[:description]
      resource.link = language[:link]
    end
  end
puts "Selected languages and resources have been seeded."
puts "Seed complete!"