# frozen_string_literal: true

require_relative 'project'
class RateBuilder

  RATE_TRAVEL_LOW = 45
  RATE_TRAVEL_HIGH = 55
  RATE_FULL_LOW = 75
  RATE_FULL_HIGH = 85

  def initialize
    @charge_rates = {}
  end

  # @param [Project] project
  def add_project!(project)
    if @first_day.nil? || project.start_date < @first_day
      @first_day = project.start_date
    end

    if @last_day.nil? || project.end_date > @last_day
      @last_day = project.end_date
    end

    (project.start_date..project.end_date).each do |date|
      current_value = @charge_rates[date]
      if current_value.nil? || current_value == :low #:low accounts for different rates on same day
        @charge_rates[date] = project.rate
      end
    end
  end

  def print_rates_per_day
    total = 0
    current_rate = nil
    next_rate = @charge_rates[@first_day]
    (@first_day..@last_day).each do |date|
      last_rate = current_rate
      current_rate = next_rate
      next_rate = @charge_rates[date + 1]

      day_type = nil
      if current_rate.nil?
        day_type = :gap
      elsif last_rate.nil?
        day_type = :travel_start
      elsif next_rate.nil?
        day_type = :travel_end
      else
        day_type = :full
      end

      charge = rate(current_rate, day_type)
      total += charge

      printf "%-10s :%-4s :%-12s $%d\n", date, current_rate, day_type, charge
    end

    puts "Total: $#{total}"
  end

  private
  def rate(rate, type)
    if type == :gap
      return 0
    elsif type  == :full
      if rate == :high
        return RATE_FULL_HIGH
      else
        return RATE_FULL_LOW
      end
    else
      if rate == :high
        return RATE_TRAVEL_HIGH
      else
        return RATE_TRAVEL_LOW
      end
    end
  end
end
