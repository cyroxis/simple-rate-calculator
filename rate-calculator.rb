#!/usr/bin/env ruby
# frozen_string_literal: tru

require 'csv'
require_relative 'project'
require_relative 'rate_builder'

file_name = ARGV.first
data = CSV.open(file_name, headers: true)

entries = data.map do |row|
  Project.new(row["rate"], row["start_date"], row["end_date"])
end

builder = RateBuilder.new

entries.each { |project| builder.add_project!(project) }

builder.print_rates_per_day