# frozen_string_literal: true

class Car
  attr_reader :id, :price_per_km, :price_per_day

  def initialize(rental)
    @id = rental['id']
    @price_per_km = rental['price_per_km']
    @price_per_day = rental['price_per_day']
  end
end
