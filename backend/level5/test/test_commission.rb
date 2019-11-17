# frozen_string_literal: true

require_relative '../helpers/test_helper'
require_relative '../models/commission'
require_relative '../models/rental'
require_relative '../models/options'
require_relative '../models/car'

describe Commission do
  describe 'when a rental is at one day' do
    rental = Rental.new('id' => 1, 'car_id' => 1, 'start_date' => '2015-12-8', 'end_date' => '2015-12-8', 'distance' => 100)
    options = Options.new([])
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, options, car)
      _(@commission.calculate).must_equal 2100
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, options, car)
      _(@commission.calculate).must_equal 450
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, options, car)
      _(@commission.calculate).must_equal 100
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, options, car)
      _(@commission.calculate).must_equal 350
    end
  end

  describe 'when a rental is at one day with options for the owner' do
    rental = Rental.new('id' => 1, 'car_id' => 1, 'start_date' => '2015-12-8', 'end_date' => '2015-12-8', 'distance' => 100)
    options = Options.new([{'id' => 1, 'rental_id' => 1, 'type' => 'gps'}, {'id' => 2, 'rental_id' => 1, 'type' => 'baby_seat'}])
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, options, car)
      _(@commission.calculate).must_equal 2800
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, options, car)
      _(@commission.calculate).must_equal 450
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, options, car)
      _(@commission.calculate).must_equal 100
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, options, car)
      _(@commission.calculate).must_equal 350
    end
  end

  describe 'when a rental is at one day with options for drivy' do
    rental = Rental.new('id' => 1, 'car_id' => 1, 'start_date' => '2015-12-8', 'end_date' => '2015-12-8', 'distance' => 100)
    options = Options.new([{'id' => 1, 'rental_id' => 1, 'type' => 'additional_insurance'}])
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, options, car)
      _(@commission.calculate).must_equal 2100
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, options, car)
      _(@commission.calculate).must_equal 450
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, options, car)
      _(@commission.calculate).must_equal 100
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, options, car)
      _(@commission.calculate).must_equal 1350
    end
  end

  describe 'when a rental is at 2 day' do
    rental = Rental.new('id' => 2, 'car_id' => 1, 'start_date' => '2015-03-31', 'end_date' => '2015-04-01', 'distance' => 300)
    options = Options.new([])
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, options, car)
      _(@commission.calculate).must_equal 4760
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, options, car)
      _(@commission.calculate).must_equal 1020
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, options, car)
      _(@commission.calculate).must_equal 200
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, options, car)
      _(@commission.calculate).must_equal 820
    end
  end

  describe 'when a rental is at 2 day with options for drivy' do
    rental = Rental.new('id' => 2, 'car_id' => 1, 'start_date' => '2015-03-31', 'end_date' => '2015-04-01', 'distance' => 300)
    options = Options.new([{'id' => 3, 'rental_id' => 2, 'type' => 'additional_insurance'}])
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, options, car)
      _(@commission.calculate).must_equal 4760
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, options, car)
      _(@commission.calculate).must_equal 1020
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, options, car)
      _(@commission.calculate).must_equal 200
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, options, car)
      _(@commission.calculate).must_equal 2820
    end
  end

  describe 'when a rental is at 6 day' do
    rental = Rental.new('id' => 2, 'car_id' => 1, 'start_date' => '2015-04-01', 'end_date' => '2015-04-06', 'distance' => 300)
    options = Options.new([])
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, options, car)
      _(@commission.calculate).must_equal 9240
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, options, car)
      _(@commission.calculate).must_equal 1980
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, options, car)
      _(@commission.calculate).must_equal 600
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, options, car)
      _(@commission.calculate).must_equal 1380
    end
  end

  describe 'when a rental is at 12 day' do
    rental = Rental.new('id' => 3, 'car_id' => 1, 'start_date' => '2015-07-3', 'end_date' => '2015-07-14', 'distance' => 1000)
    options = Options.new([])
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, options, car)
      _(@commission.calculate).must_equal 19460
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, options, car)
      _(@commission.calculate).must_equal 4170
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, options, car)
      _(@commission.calculate).must_equal 1200
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, options, car)
      _(@commission.calculate).must_equal 2970
    end
  end
end
