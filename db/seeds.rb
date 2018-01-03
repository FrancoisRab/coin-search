puts "Cleaning database..."
Store.destroy_all

puts "Creating stores..."

stores_attributes = [
{
  category: "Antiquaire",
  name: "Marie & Benoit",
  description: "description",
  address: "6 passage du grand cerf",
  postcode: 75002,
  opening_hours: "opening hours",
  crypto: "Bitcoin",
  website: "site internet",
  contact: "06 62 30 14 92"

}
]


Store.create!(stores_attributes)



puts "Finished!"


  # contact = {
  #   phone: "06 62 30 14 92",
  #   email: "mariebenoit.iledere@gmail.com"
  # }
