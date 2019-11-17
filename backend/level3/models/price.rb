# frozen_string_literal: true

require 'date'
require_relative './rental'
require_relative './car'

class Price
  def initialize(rental, car)
    @rental = rental
    @car = car
  end

  def calculate
    days_of_rental = (1 + Date.parse(@rental.end_date).mjd - Date.parse(@rental.start_date).mjd)

    discount = get_discount(days_of_rental)

    distance_price = @car.price_per_km * @rental.distance
    day_price = @car.price_per_day * (1 + Date.parse(@rental.end_date).mjd - Date.parse(@rental.start_date).mjd) * (1 - discount)

    (distance_price + day_price).ceil
  end

  private

  def get_discount(days_of_rental)
    case days_of_rental
    when 1
      0
    when 2..4
      0.1 * (days_of_rental - 1) / days_of_rental
    when 5..10
      (0.1 * 3 + 0.3 * (days_of_rental - 4)) / days_of_rental
    else
      (0.1 * 3 + 0.3 * 6 + 0.5 * (days_of_rental - 10)) / days_of_rental
    end
  end
end
