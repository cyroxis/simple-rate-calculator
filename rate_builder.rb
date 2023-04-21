# frozen_string_literal: true

require_relative 'project'
class RateBuilder
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
    (@first_day..@last_day).each do |date|
      rate = @charge_rates[date]
      puts "#{date}: #{rate}"
    end
  end
end
