# frozen_string_literal: true

require 'json'
require 'date'
require_relative './price'
require_relative './commission'
require_relative './rental'
require_relative './car'

class Getaround
  def initialize(input_file_path)
    file = File.read input_file_path
    @data = JSON.parse(file)
  end

  def generate_output
    output = @data['rentals'].map do |r|
      car = get_car(r['car_id'])
      format_output(r, car)
    end

    File.write './data/output.json', JSON.pretty_generate(rentals: output)
  end

  private

  def get_car(id)
    @data['cars'].detect { |c| c['id'] == id }
  end

  def format_output(rental, car)
    {
      id: rental['id'],
      price: Price.new(Rental.new(rental), Car.new(car)).calculate,
      commission: Commission.new(Rental.new(rental), Car.new(car)).calculate
    }
  end
end
