# frozen_string_literal: true

require 'json'
require_relative './actions'
require_relative './options'
require_relative './rental'
require_relative './car'

class Getaround
  def initialize(input_file_path)
    file = File.read input_file_path
    @data = JSON.parse(file)
  end

  def generate_output
    output = @data['rentals'].map do |rental|
      car = get_car(rental['car_id'])
      options = get_options(rental['id'])
      format_output(rental, options, car)
    end

    File.write './data/output.json', JSON.pretty_generate(rentals: output)
  end

  private

  def get_car(id)
    @data['cars'].detect { |c| c['id'] == id }
  end

  def get_options(id)
    @data['options'].select { |o| o['rental_id'] == id }
  end

  def format_output(rental, options, car)
    {
      id: rental['id'],
      options: Options.new(options).list,
      actions: Actions.new(
        Rental.new(rental),
        Options.new(options), Car.new(car)
      ).calculate
    }
  end
end
