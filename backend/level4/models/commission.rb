# frozen_string_literal: true

require 'date'
require_relative './price'
require_relative './rental'
require_relative './car'

class Commission
  def initialize(type, rental, car)
    @type = type
    @rental = rental
    @car = car
  end

  def calculate
    price = Price.new(@rental, @car).calculate
    total_commission = price * 0.3
    insurance_fee = total_commission * 0.5
    assistance_fee = 100 * @rental.total_days

    result = case @type
             when 'owner'
               price * 0.7
             when 'insurance'
               insurance_fee
             when 'assistance'
               assistance_fee
             when 'drivy'
               (total_commission - insurance_fee - assistance_fee)
             end

    result.ceil
  end
end
