# frozen_string_literal: true

require_relative '../helpers/test_helper'
require_relative '../models/commission'
require_relative '../models/rental'
require_relative '../models/car'

describe Commission do
  describe 'when a rental is at one day' do
    rental = Rental.new('id' => 1, 'car_id' => 1, 'start_date' => '2015-12-8', 'end_date' => '2015-12-8', 'distance' => 100)
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees' do
      @commission = Commission.new(rental, car)
      _(@commission.calculate).must_equal(
        insurance_fee: 450,
        assistance_fee: 100,
        drivy_fee: 350
      )
    end
  end

  describe 'when a rental is at 2 day' do
    rental = Rental.new('id' => 2, 'car_id' => 1, 'start_date' => '2015-03-31', 'end_date' => '2015-04-01', 'distance' => 300)
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees' do
      @commission = Commission.new(rental, car)
      _(@commission.calculate).must_equal(
        insurance_fee: 1020,
        assistance_fee: 200,
        drivy_fee: 820
      )
    end
  end

  describe 'when a rental is at 6 day' do
    rental = Rental.new('id' => 2, 'car_id' => 1, 'start_date' => '2015-04-01', 'end_date' => '2015-04-06', 'distance' => 300)
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees' do
      @commission = Commission.new(rental, car)
      _(@commission.calculate).must_equal(
        insurance_fee: 1980,
        assistance_fee: 600,
        drivy_fee: 1380
      )
    end
  end

  describe 'when a rental is at 12 day' do
    rental = Rental.new('id' => 3, 'car_id' => 1, 'start_date' => '2015-07-3', 'end_date' => '2015-07-14', 'distance' => 1000)
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees' do
      @commission = Commission.new(rental, car)
      _(@commission.calculate).must_equal(
        insurance_fee: 4170,
        assistance_fee: 1200,
        drivy_fee: 2970
      )
    end
  end
end
