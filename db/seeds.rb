puts "Cleaning database..."
Store.destroy_all

puts "Creating stores..."

stores_attributes = [
  {
    user_id: User.first.id,
    open: true,
    category: "Antiquaire",
    name: "Marie & Benoit",
    description: "description",
    address: "6 passage du grand cerf, Paris",
    postcode: 75012,
    opening_hours: "opening hours",
    crypto: "Bitcoin",
    website: "site internet",
    contact: "06 62 30 14 92",
  },
  {
    user_id: User.first.id,
    open: true,
    category: "Coworking",
    name: "La Maison du Bitcoin",
    description: "Venez découvrir le monde des crypto",
    address: "35 rue du Caire, Paris",
    postcode: 75002,
    opening_hours: "9h30 - 20h",
    crypto: "Bitcoin",
    website: "https://lamaisondubitcoin.fr/",
    contact: "06 62 30 14 92",
  },
  {
    user_id: User.first.id,
    open: true,
    category: "Bar",
    name: "Sof's Bar",
    description: "Le premier bar parisien qui accèpte les cryptos",
    address: "43 rue saint sauveur, Paris",
    postcode: 75002,
    opening_hours: "10h30 - 2h",
    crypto: "Bitcoin",
    website: "http://www.sofsbar.fr/",
    contact: "contact@sofsbar.fr",
  }
]


Store.create!(stores_attributes)




puts "Finished!"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
