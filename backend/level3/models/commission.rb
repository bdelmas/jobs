# frozen_string_literal: true

require 'date'
require_relative './price'
require_relative './rental'
require_relative './car'

class Commission
  def initialize(rental, car)
    @rental = rental
    @car = car
  end

  def calculate
    price = Price.new(@rental, @car).calculate
    total_commission = price * 0.3
    insurance_fee = total_commission * 0.5
    assistance_fee = 100 * @rental.total_days

    {
      insurance_fee: insurance_fee.ceil,
      assistance_fee: assistance_fee.ceil,
      drivy_fee: (total_commission - insurance_fee - assistance_fee).ceil
    }
  end
end
