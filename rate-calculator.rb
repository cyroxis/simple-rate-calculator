#!/usr/bin/env ruby
# frozen_string_literal: tru

require 'csv'
require_relative 'project'

file_name = ARGV.first
data = CSV.open(file_name, headers: true)

entries = data.map do |row|
  Project.new(row["rate"], row["start_date"], row["end_date"])
end

entries.sort_by! { |project| project.start_date }



puts entries.to_s