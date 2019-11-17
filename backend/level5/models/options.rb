# frozen_string_literal: true

class Options
  def initialize(options)
    @options = options
  end

  def list
    @options.map { |o| o['type'] }
  end
end
