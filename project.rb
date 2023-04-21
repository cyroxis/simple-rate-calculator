# frozen_string_literal: true

class Project
  def initialize(rate, start_date, end_date)
    if rate == "HIGH"
      @rate = :high
    elsif rate == "LOW"
      @rate = :low
    else
      raise "Unexpected rate input #{rate}"
    end

    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)

  end

  attr_reader :rate, :start_date, :end_date
end
