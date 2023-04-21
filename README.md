# simple-rate-calculator

A simple program used to calculate reimbursement rates for a series of project given the following rules
* First day and last day of a project, or sequence of projects, is a travel day.
* Any day in the middle of a project, or sequence of projects, is considered a full day.
* If there is a gap between projects, then the days on either side of that gap are travel days.
* If two projects push up against each other, or overlap, then those days are full days as well.
* Any given day is only ever counted once, even if two projects are on the same day.
* A travel day is reimbursed at a rate of $45 dollars per day in a low cost city.
* A travel day is reimbursed at a rate of $55 dollars per day in a high cost city.
* A full day is reimbursed at a rate of $75 dollars per day in a low cost city.
* A full day is reimbursed at a rate of $85 dollars per day in a high cost city.

### Running
Application is built in Ruby 3.2.2

    ./rate-calculator.rb <file_name.csv>

### CSV Format
Several example files are included in project

Columns: 
- `rate`: either `HIGH` or `LOW`
- `start_date`: YYYY/MM/DD
- `end_date`: YYYY/MM/DD


    