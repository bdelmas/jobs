# frozen_string_literal: true

require_relative '../helpers/test_helper'
require_relative '../models/price'

describe Price do
  describe 'when a rental is at one day' do
    rental = { 'id' => 1, 'car_id' => 1, 'start_date' => '2015-12-8', 'end_date' => '2015-12-8', 'distance' => 100 }
    car = { 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 }

    it 'must respond 3000' do
      @price = Price.new(rental, car)
      _(@price.calculate).must_equal 3000
    end
  end

  describe 'when a rental is at 2 day' do
    rental = { "id" => 2, "car_id" => 1, "start_date" => "2015-03-31", "end_date" => "2015-04-01", "distance" => 300 }
    car = { 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 }

    it 'must respond 6800' do
      @price = Price.new(rental, car)
      _(@price.calculate).must_equal 6800
    end
  end

  describe 'when a rental is at 6 day' do
    rental = { "id" => 2, "car_id" => 1, "start_date" => "2015-04-01", "end_date" => "2015-04-06", "distance" => 300 }
    car = { 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 }

    it 'must respond 13200' do
      @price = Price.new(rental, car)
      _(@price.calculate).must_equal 13_200
    end
  end

  describe 'when a rental is at 12 day' do
    rental = { "id" => 3, "car_id" => 1, "start_date" => "2015-07-3", "end_date" => "2015-07-14", "distance" => 1000 }
    car = { 'id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10 }

    it 'must respond 27800' do
      @price = Price.new(rental, car)
      _(@price.calculate).must_equal 27_800
    end
  end
end
