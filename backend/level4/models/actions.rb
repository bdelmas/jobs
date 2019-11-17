# frozen_string_literal: true

require_relative './action'

class Actions
  def initialize(rental, car)
    @rental = rental
    @car = car
  end

  def calculate
    %w[driver owner insurance assistance drivy].map do |a|
      Action.new(a, @rental, @car).format
    end
  end
end
