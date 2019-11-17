# frozen_string_literal: true

require_relative './models/getaround'

Getaround.new('./data/input.json').generate_output
