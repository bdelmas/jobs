# frozen_string_literal: true

require 'json'
require 'date'

file = File.read './data/input.json'
data = JSON.parse(file)

def get_car(data, id)
  data['cars'].detect { |c| c['id'] == id }
end

def calc_price(price_per_km, price_per_day, distance, start_date, end_date)
  price_per_km * distance +
    price_per_day * (1 + Date.parse(end_date).mjd - Date.parse(start_date).mjd)
end

output = data['rentals'].map do |r|
  car = get_car(data, r['car_id'])

  {
    id: r['id'],
    price: calc_price(
      car['price_per_km'],
      car['price_per_day'],
      r['distance'],
      r['start_date'],
      r['end_date']
    )
  }
end

File.write './data/output.json', JSON.pretty_generate(rentals: output)
