# frozen_string_literal: true

require_relative '../helpers/test_helper'
require_relative '../models/price'
require_relative '../models/rental'
require_relative '../models/car'

describe Price do
  describe 'when a rental is at one day' do
    rental = Rental.new({ 'id' => 1, 'car_id' => 1, 'start_date' => '2015-12-8', 'end_date' => '2015-12-8', 'distance' => 100 })
    options = Options.new([])
    car = Car.new({ 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 })

    it 'must respond 3000' do
      @price = Price.new(rental, options, car)
      _(@price.calculate).must_equal 3000
    end
  end

  describe 'when a rental is at one day with 2 options for the owner' do
    rental = Rental.new({ 'id' => 1, 'car_id' => 1, 'start_date' => '2015-12-8', 'end_date' => '2015-12-8', 'distance' => 100 })
    options = Options.new([{'id' => 1, 'rental_id' => 1, 'type' => 'gps'}, {'id' => 2, 'rental_id' => 1, 'type' => 'baby_seat'}])
    car = Car.new({ 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 })

    it 'must respond 3700' do
      @price = Price.new(rental, options, car)
      _(@price.calculate).must_equal 3700
    end
  end

  describe 'when a rental is at 2 day' do
    rental = Rental.new({ 'id' => 2, 'car_id' => 1, 'start_date' => '2015-03-31', 'end_date' => '2015-04-01', 'distance' => 300 })
    options = Options.new([])
    car = Car.new({ 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 })

    it 'must respond 6800' do
      @price = Price.new(rental, options, car)
      _(@price.calculate).must_equal 6800
    end
  end

  describe 'when a rental is at 2 day with options for drivy' do
    rental = Rental.new({ 'id' => 2, 'car_id' => 1, 'start_date' => '2015-03-31', 'end_date' => '2015-04-01', 'distance' => 300 })
    options = Options.new([{'id' => 1, 'rental_id' => 1, 'type' => 'additional_insurance'}])
    car = Car.new({ 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 })

    it 'must respond 8800' do
      @price = Price.new(rental, options, car)
      _(@price.calculate).must_equal 8800
    end
  end

  describe 'when a rental is at 6 day' do
    rental = Rental.new({ 'id' => 2, 'car_id' => 1, 'start_date' => '2015-04-01', 'end_date' => '2015-04-06', 'distance' => 300 })
    options = Options.new([])
    car = Car.new({ 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 })

    it 'must respond 13200' do
      @price = Price.new(rental, options, car)
      _(@price.calculate).must_equal 13_200
    end
  end

  describe 'when a rental is at 12 day' do
    rental = Rental.new({ 'id' => 3, 'car_id' => 1, 'start_date' => '2015-07-3', 'end_date' => '2015-07-14', 'distance' => 1000 })
    options = Options.new([])
    car = Car.new({ 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 })

    it 'must respond 27800' do
      @price = Price.new(rental, options, car)
      _(@price.calculate).must_equal 27_800
    end
  end
end
