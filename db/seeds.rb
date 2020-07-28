require_relative '../config/environment.rb'


User.delete_all
Location.delete_all
FavoriteLocation.delete_all

location1 = Location.create(country: "USA", hotspot: "NYC", things_to_do: "Visit Statue of Liberty")
location2 = Location.create(country: "France", hotspot: "Paris", things_to_do: "Visit Eifel Tower")
location3 = Location.create(country:"India", hotspot: "Uttar Pradesh", things_to_do: "Visit Taj Mahal")


u1 = User.create(name: "George")
u2 = User.create(name: "Jeff")
u3 = User.create(name: "Beth")

fl1 = FavoriteLocation.create(user_id: u1.id, location_id: location1.id)
fl2 = FavoriteLocation.create(user_id: u2.id, location_id: location2.id)
fl3 = FavoriteLocation.create(user_id: u3.id, location_id: location3.id)
