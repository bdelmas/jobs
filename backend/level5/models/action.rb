# frozen_string_literal: true

require_relative './price'
require_relative './Commission'

class Action
  def initialize(type, rental, options, car)
    @type = type
    @rental = rental
    @options = options
    @car = car
  end

  def format
    case @type
    when 'driver'
      {
        who: @type,
        type: type,
        amount: Price.new(@rental, @options, @car).calculate
      }
    when 'owner'
      {
        who: @type,
        type: type,
        amount: Commission.new(@type, @rental, @options, @car).calculate
      }
    when 'insurance'
      {
        who: @type,
        type: type,
        amount: Commission.new(@type, @rental, @options, @car).calculate
      }
    when 'assistance'
      {
        who: @type,
        type: type,
        amount: Commission.new(@type, @rental, @options, @car).calculate
      }
    when 'drivy'
      {
        who: @type,
        type: type,
        amount: Commission.new(@type, @rental, @options, @car).calculate
      }
    end
  end

  private

  def type
    return 'debit' if @type == 'driver'

    'credit'
  end
end
