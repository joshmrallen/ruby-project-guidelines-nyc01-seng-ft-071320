
User.delete_all
Location.delete_all
FavoriteLocation.delete_all

location1 = Location.create(country: "USA", city: "NYC", poi: "Visit Statue of Liberty")
location2 = Location.create(country: "France", city: "Paris", poi: "Visit Eifel Tower")
location3 = Location.create(country:"India", city: "Uttar Pradesh", poi: "Visit Taj Mahal")


george = User.create(name: "George")
jeff = User.create(name: "Jeff")
beth = User.create(name: "Beth")

fl1 = FavoriteLocation.create(user_id: george.id, location_id: location1.id)
fl2 = FavoriteLocation.create(user_id: jeff.id, location_id: location2.id)
fl3 = FavoriteLocation.create(user_id: beth.id, location_id: location3.id)