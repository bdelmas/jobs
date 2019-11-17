# frozen_string_literal: true

require_relative './price'

class Commission
  def initialize(type, rental, options, car)
    @type = type
    @options = options
    @rental = rental
    @car = car
  end

  def calculate
    basic_price = Price.new(@rental, @options, @car).calculate_basic_price
    commission_on_basic_price = basic_price * 0.3
    insurance_fee = commission_on_basic_price * 0.5
    assistance_fee = 100 * @rental.total_days

    result = 0
    case @type
    when 'owner'
      result += basic_price * 0.7
      result += 500 * @rental.total_days if @options.list.include? 'gps'
      result += 200 * @rental.total_days if @options.list.include? 'baby_seat'
    when 'insurance'
      result += insurance_fee
    when 'assistance'
      result += assistance_fee
    when 'drivy'
      result += (commission_on_basic_price - insurance_fee - assistance_fee)
      result += 1_000 * @rental.total_days if @options.list.include? 'additional_insurance'
    end

    result.ceil
  end
end
