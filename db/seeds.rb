Player.destroy_all
Game.destroy_all
Profile.destroy_all

cod = Game.create(title: "Call of duty", rating: 10, genre: "first person shooter")
batman = Game.create(title: "Batman", rating: 7, genre: "adventure/action")
fifa = Game.create(title: "Fifa 20", rating: 8, genre: "Sports")
nhl = Game.create(title: "NHL 20", rating: 10, genre: "Sports")




