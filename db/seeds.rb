# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Market.destroy_all

require "open-uri"
require "nokogiri"


def scrape_all_urls
  html = open("https://www.lyon.fr/equipements?search_api_fulltext=&field_secteur_geographique=All&items_per_page=100&field_sous_types_tmp=1487&field_sous_types_tmp_bis=1641&field_sous_types=1609").read
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
  img = ["https://img.theculturetrip.com/450x300/smart/wp-content/uploads/2018/06/saint-antoine.jpg","https://media.lyon-france.com/1280x854/117713/3932426.jpg", "https://www.ouest-france.fr/sites/default/files/styles/image-640/public/2018/02/22/plus-beau-marche-de-france-trois-marches-representeront-l-ouest_2.jpg?itok=65WgHjG0", 'https://mairie2.lyon.fr/sites/mairie2/files/march%C3%A9-arrdts-p.jpg'].sample
  name = doc.search('h1 span').text
  street = doc.search('.field--name-field-adresse .field--item').text
  postal_code = doc.search('.field--name-field-code-postal div.field--item').text
  city = doc.search('.field--name-field-ville div.field--item').text
  opening_hours = doc.search('.field--name-field-horaires').text.gsub("\n",'').gsub!("  ",'').gsub!("Horaires",'')
  vendors = doc.search('.field--name-field-informations p:nth-of-type(1)').text.gsub("\n",'')
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

url_results = scrape_all_urls
url_results = url_results
iterate_thorug_url(url_results)
