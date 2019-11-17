# frozen_string_literal: true

require_relative './action'

class Actions
  def initialize(rental, options, car)
    @rental = rental
    @options = options
    @car = car
  end

  def calculate
    %w[driver owner insurance assistance drivy].map do |type|
      Action.new(type, @rental, @options, @car).format
    end
  end
end
