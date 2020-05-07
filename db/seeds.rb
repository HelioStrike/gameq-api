# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

game_attr = [
    { name: "League of Legends" },
    { name: "Hollow Knight" },
    { name: "Overwatch" },
]
  
game_attr.each do |attr|
    Game.create(attr)
end

character_attr = [
    { name: "Yasuo", game_id: 1 },
    { name: "Rune", game_id: 2 },
    { name: "D.Va", game_id: 3 },
]
  
character_attr.each do |attr|
    Character.create(attr)
end

quote_attr = [
    { text: "There are three certainties in life: honor, death, and hangovers.", character_id: 1, game_id: 1 },
    { text: "You shall seal the blinding light that plagues their dreams. You are the Vessel. You are the Hollow Knight.", character_id: 2, game_id: 2 },
    { text: "Nerf this!", character_id: 3, game_id: 3 },
]
  
quote_attr.each do |attr|
    Quote.create(attr)
end

waiting_quote_attr = [
    { game: "Hollow Knight", character: "Pale King", quote: "No mind to think. No will to break. No voice to cry suffering. Born of God and Void." },
    { game: "Dead Cells", character: "Tutorial Knight", quote: "Aren't you the headless fellow that's been getting around?" },
]
  
waiting_quote_attr.each do |attr|
    Waitingquote.create(attr)
end
