# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
#
#

require "open-uri"
require "nokogiri"


def scrape_all_urls(url)
  html = open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")
  url_results = []
  doc.search('.group-actu a').each do |element|
    url_results << 'https://www.lyon.fr' + element.attribute('href').value
  end
  url_results
end

def detail_scraping(url)
  html = open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")
  # 2. For the first five results
  results = []
  img = ["https://img.theculturetrip.com/450x300/smart/wp-content/uploads/2018/06/saint-antoine.jpg","https://media.lyon-france.com/1280x854/117713/3932426.jpg",  "https://images.unsplash.com/photo-1516463746734-30c21edde5af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1561385945-c99789cd12d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" "https://www.ouest-france.fr/sites/default/files/styles/image-640/public/2018/02/22/plus-beau-marche-de-france-trois-marches-representeront-l-ouest_2.jpg?itok=65WgHjG0", "https://images.unsplash.com/photo-1589140854530-3955778150b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1536953705238-a34098616ed1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"].sample
  name = doc.search('h1 span').text
  street = doc.search('.field--name-field-adresse .field--item').text
  postal_code = doc.search('.field--name-field-code-postal div.field--item').text
  city = doc.search('.field--name-field-ville div.field--item').text
  opening_hours = doc.search('.field--name-field-horaires').text.gsub("\n",'').gsub!("  ",'').gsub!("Horaires",'')
  vendors = doc.search('.field--name-field-informations p:nth-of-type(1)').text.gsub(/[^0-9]/, '')
  products = doc.search('.field--name-field-informations p:nth-of-type(2)').text.gsub("\n",'')
  info = doc.search('.field--name-field-informations p:nth-of-type(3)').text.gsub("\n",'')
  open_on = [false, false, false, false, false, false, false]
  bio = false
  night =false

  market = Market.new(
    img: img,
    name: name,
    street: street,
    postal_code: postal_code,
    city: city,
    opening_hours: opening_hours,
    vendors: vendors,
    products: products,
    info: info,
    open_on: open_on,
    bio: bio,
    night: night
  )
  market.save!
  puts "sucees for seeds #{market.name}"
end

# ap scrape_all_urls
def iterate_thorug_url(arr_urls)
  arr_urls.each do |url|
    detail_scraping(url)
  end
end

puts "Cleaning database..."
Market.destroy_all
url_results = scrape_all_urls("https://www.lyon.fr/equipements?search_api_fulltext=&field_secteur_geographique=All&items_per_page=100&field_sous_types_tmp=1487&field_sous_types_tmp_bis=1641&field_sous_types=1609")
iterate_thorug_url(url_results)
puts "created #{Market.count} markets"
url_results_2 = scrape_all_urls("https://www.lyon.fr/equipements?search_api_fulltext=&field_secteur_geographique=All&field_sous_types_tmp=1487&field_sous_types_tmp_bis=1641&field_sous_types=1608")
iterate_thorug_url(url_results_2)
puts "created #{Market.count} markets"
url_results_3 = scrape_all_urls("https://www.lyon.fr/equipements?search_api_fulltext=&field_secteur_geographique=All&field_sous_types_tmp=1487&field_sous_types_tmp_bis=1641&field_sous_types=1610")
iterate_thorug_url(url_results_3)
puts "created #{Market.count} markets"

markets = Market.all
markets.each do |market|

  market.name.gsub!(" alimentaire",'')

  if market.name.include? "biologique"
    print market.name
    print " --> "
    market.bio = true
    market.name.gsub!(" biologique","bio")
    print market.name
  end

  if market.name.include? " du soir"
    print market.name
    print " --> "
    market.night = true
    market.name.gsub!(" du soir","soir")
    print market.name
  end

  p market.open_on[0] = true if market.opening_hours.include? "lundi"
  p market.open_on[1] = true if market.opening_hours.include? "mardi"
  p market.open_on[2] = true if market.opening_hours.include? "mercredi"
  p market.open_on[3] = true if market.opening_hours.include? "jeudi"
  p market.open_on[4] = true if market.opening_hours.include? "vendredi"
  p market.open_on[5] = true if market.opening_hours.include? "samedi"
  p market.open_on[6] = true if market.opening_hours.include? "dimanche"

  p ""

  market.save
end
