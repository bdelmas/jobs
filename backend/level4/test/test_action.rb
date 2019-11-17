# frozen_string_literal: true

require_relative '../helpers/test_helper'
require_relative '../models/Action'
require_relative '../models/rental'
require_relative '../models/car'

describe Action do
  before do
    @rental = Rental.new('id' => 1, 'car_id' => 1, 'start_date' => '2015-12-8', 'end_date' => '2015-12-8', 'distance' => 100)
    @car = Car.new('id' => 1, 'price_per_day' => 2000, 'price_per_km' => 10)
  end

  describe 'when the type is a driver' do
    it 'must respond with the format for driver' do
      @action = Action.new('driver', @rental, @car)
      _(@action.format).must_equal(
        who: 'driver',
        type: 'debit',
        amount: 3000
      )
    end
  end

  describe 'when the type is an owner' do
    it 'must respond with the format for owner' do
      @action = Action.new('owner', @rental, @car)
      _(@action.format).must_equal(
        who: 'owner',
        type: 'credit',
        amount: 2100
      )
    end
  end

  describe 'when the type is an insurance' do
    it 'must respond with the format for insurance' do
      @action = Action.new('insurance', @rental, @car)
      _(@action.format).must_equal(
        who: 'insurance',
        type: 'credit',
        amount: 450
      )
    end
  end

  describe 'when the type is an assistance' do
    it 'must respond with the format for assistance' do
      @action = Action.new('assistance', @rental, @car)
      _(@action.format).must_equal(
        who: 'assistance',
        type: 'credit',
        amount: 100
      )
    end
  end

  describe 'when the type is drivy' do
    it 'must respond with the format for drivy' do
      @action = Action.new('drivy', @rental, @car)
      _(@action.format).must_equal(
        who: 'drivy',
        type: 'credit',
        amount: 350
      )
    end
  end
end
