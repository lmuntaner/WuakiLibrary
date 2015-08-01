# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Item.delete_all
Episode.delete_all
PurchaseOption.delete_all
Purchase.delete_all

puts "---------- All Data Destroyed -------------"

sheldon = User.create!(username: 'SheldonCooper', email: 'sheldon@awesome.com', password: 'amy')

movies_info = {
  'fight club': 'someone fighting with himself',
  'juno': 'early pregnancy',
  'the lion king': 'irresponsible child',
  'trainspotting': 'scotland sucks',
  'basketball diaries': 'not enough basketball',
  'primos': 'spanish losers'
}

purchase_option_ids = []

movies_info.each do |title, plot|
  item = Item.create!(title: title, plot: plot, category: "Movie")
  hd_purchase_option = item.purchase_options.create!(quality: 'HD', price: 2.99)
  purchase_option_ids << hd_purchase_option.id
  sd_purchase_option = item.purchase_options.create!(quality: 'SD', price: 2.99)
  purchase_option_ids << sd_purchase_option.id
end

seasons = %w(
  Game\ Of\ Thrones\ Season\ 1  Game\ Of\ Thrones\ Season\ 2
  Game\ Of\ Thrones\ Season\ 3 Game\ Of\ Thrones\ Season\ 4
  Game\ Of\ Thrones\ Season\ 5 )

seasons_info = {}
seasons_info[seasons[0]] = {
  1 => 'Winter is Coming',
  2 => 'The KingsRoad',
  3 => 'Lord Snow',
  4 => 'Cripples, Bastards, and Broken Things',
  5 => 'The Wolf and the Lion',
  6 => 'A Golden Crown',
  7 => 'You Win or You Die',
  8 => 'The Pointy End',
  9 => 'Baelor',
  10 => 'Fire and Blood'
}

seasons_info[seasons[1]] = {
  1 => 'The North Remembers',
  2 => 'The Night Lands',
  3 => 'What Is Dead May Never Die',
  4 => 'Garden of Bones',
  5 => 'The Ghost of Harrenhal',
  6 => 'The Old Gods and the New',
  7 => 'A Man Without Honor',
  8 => 'The Prince of Winterfell',
  9 => 'Blackwater',
  10 => 'Valar Morghulis'
}

seasons_info[seasons[2]] = {
  1 => 'Valar Dohaeris',
  2 => 'Dark Wings, Dark Words',
  3 => 'Walk of Punishment',
  4 => 'And Now His Watch Is Ended',
  5 => 'Kissed by Fire',
  6 => 'The Climb',
  7 => 'The Baer and the Maiden Fair',
  8 => 'Second Sons',
  9 => 'The Rains of Castamere',
  10 => 'Mhysa'
}

seasons_info[seasons[3]] = {
  1 => 'Two Swords',
  2 => 'The Lion and the Rose',
  3 => 'Breaker of Chains',
  4 => 'Oathkeeper',
  5 => 'First of His Name',
  6 => 'The Laws of Gods and Men',
  7 => 'Mockingbird',
  8 => 'The Mountain and the Viper',
  9 => 'The Watchers on the Wall',
  10 => 'The Children'
}

seasons_info[seasons[4]] = {
  1 => 'The Wars to Come',
  2 => 'The House of Black and White',
  3 => 'High Sparrow',
  4 => 'Sons of the Harpy',
  5 => 'Kill the Boy',
  6 => 'Unbowed, Unbent, Unbroken',
  7 => 'The Gift',
  8 => 'Hardhome',
  9 => 'The Dance of Dragons',
  10 => "Mother's Mercy"
}

seasons_info.each do |season_title, episodes_info|
  season = Item.create!(title: season_title, category: "Season")
  hd_purchase_option = season.purchase_options.create!(quality: 'HD', price: 4.99)
  purchase_option_ids << hd_purchase_option.id
  sd_purchase_option = season.purchase_options.create!(quality: 'SD', price: 4.99)
  purchase_option_ids << sd_purchase_option.id
  episodes_info.each do |order, title|
    season.episodes.create!(order: order, title: title, plot: Faker::Hacker.say_something_smart)
  end
end

5.times do |i|
  num_purchase_options = purchase_option_ids.size
  random_purchase_option_id = purchase_option_ids.first + rand(num_purchase_options)
  sheldon.purchases.create(purchase_option_id: random_purchase_option_id)
end




puts "---------- All Data Reset -------------"
