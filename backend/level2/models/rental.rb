# frozen_string_literal: true

class Rental
  attr_reader :id, :car_id, :distance, :start_date, :end_date

  def initialize(rental)
    @id = rental['id']
    @car_id = rental['car_id']
    @distance = rental['distance']
    @start_date = rental['start_date']
    @end_date = rental['end_date']
  end
end
