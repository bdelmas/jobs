# frozen_string_literal: true

require_relative '../helpers/test_helper'
require_relative '../models/commission'
require_relative '../models/rental'
require_relative '../models/car'

describe Commission do
  describe 'when a rental is at one day' do
    rental = Rental.new('id' => 1, 'car_id' => 1, 'start_date' => '2015-12-8', 'end_date' => '2015-12-8', 'distance' => 100)
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, car)
      _(@commission.calculate).must_equal 2100
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, car)
      _(@commission.calculate).must_equal 450
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, car)
      _(@commission.calculate).must_equal 100
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, car)
      _(@commission.calculate).must_equal 350
    end
  end

  describe 'when a rental is at 2 day' do
    rental = Rental.new('id' => 2, 'car_id' => 1, 'start_date' => '2015-03-31', 'end_date' => '2015-04-01', 'distance' => 300)
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, car)
      _(@commission.calculate).must_equal 4760
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, car)
      _(@commission.calculate).must_equal 1020
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, car)
      _(@commission.calculate).must_equal 200
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, car)
      _(@commission.calculate).must_equal 820
    end
  end

  describe 'when a rental is at 6 day' do
    rental = Rental.new('id' => 2, 'car_id' => 1, 'start_date' => '2015-04-01', 'end_date' => '2015-04-06', 'distance' => 300)
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, car)
      _(@commission.calculate).must_equal 9240
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, car)
      _(@commission.calculate).must_equal 1980
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, car)
      _(@commission.calculate).must_equal 600
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, car)
      _(@commission.calculate).must_equal 1380
    end
  end

  describe 'when a rental is at 12 day' do
    rental = Rental.new('id' => 3, 'car_id' => 1, 'start_date' => '2015-07-3', 'end_date' => '2015-07-14', 'distance' => 1000)
    car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)

    it 'must respond with corresponding fees for owner' do
      @commission = Commission.new('owner', rental, car)
      _(@commission.calculate).must_equal 19460
    end

    it 'must respond with corresponding fees for insurance' do
      @commission = Commission.new('insurance', rental, car)
      _(@commission.calculate).must_equal 4170
    end

    it 'must respond with corresponding fees for assistance' do
      @commission = Commission.new('assistance', rental, car)
      _(@commission.calculate).must_equal 1200
    end

    it 'must respond with corresponding fees for drivy' do
      @commission = Commission.new('drivy', rental, car)
      _(@commission.calculate).must_equal 2970
    end
  end
end
