# frozen_string_literal: true

class Price
  def initialize(rental, options, car)
    @rental = rental
    @options = options
    @car = car
  end

  def calculate
    raw_price = calculate_basic_price
    options_price = calculate_options

    (raw_price + options_price).ceil
  end

  def calculate_basic_price
    days_of_rental = @rental.total_days
    discount = get_discount(days_of_rental)

    distance_price = @car.price_per_km * @rental.distance
    day_price = @car.price_per_day * @rental.total_days * (1 - discount)

    (distance_price + day_price).ceil
  end

  def calculate_options
    options_price = 0

    if @options.list.include? 'gps'
      options_price += 500 * @rental.total_days
    end
    if @options.list.include? 'baby_seat'
      options_price += 200 * @rental.total_days
    end
    if @options.list.include? 'additional_insurance'
      options_price += 1_000 * @rental.total_days
    end

    options_price.ceil
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
