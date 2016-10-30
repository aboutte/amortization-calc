#--
# amortable - Loan payment calculator and amortization schedule printer
# Version: 0.1.0
# Made by: francisco@tolesco.com
# Date: 2016/10/31
#
# The MIT License
# Copyright (c) 2015-2016 Jesús Francisco Rodríguez Pérez (tolesco)
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

class Loan
  # Make attributes accessible
  attr_accessor :principal, :interest_rate, :periods, :payment_type

  def initialize(principal, interest_rate, periods, payment_type)
    @principal = principal
    @interest_rate = interest_rate
    @periods = periods
    @payment_type = payment_type
  end

  # Return yearly frecuency by selected payment type
  def payment_type_yearly_frecuency(payment_type)
    case payment_type
    when 1 then 12
    when 2 then 26
    when 3 then 52
    else 12
    end
  end

  def payment_type_name(payment_type)
    case payment_type
    when 1 then 'monthly'
    when 2 then 'biweekly'
    when 3 then 'weekly'
    else 'monthly'
    end
  end

  # Return fixed payment during all loan
  def payment(principal, interest_rate, payment_type, periods)
    (principal * ( (interest_rate/payment_type_yearly_frecuency(payment_type)/(1-((1+interest_rate/payment_type_yearly_frecuency(payment_type))**(periods * -1)))) )).round(2)
  end

  # Print an amortization table for this loan
  def amortization_table(loan)
    # New empty arrays
    periods = Array.new(loan.periods)
    payments = Array.new(loan.periods)
    principals = Array.new(loan.periods)
    interests = Array.new(loan.periods)
    balances = Array.new(loan.periods)

    # Initial conditions
    payments[0] = 0
    principals[0] = 0
    interests[0] = 0
    balances[0] = loan.principal

    # Fill arrays
    for i in(1..loan.periods)
      if i != loan.periods
        payments[i] = payment(loan.principal, loan.interest_rate, loan.payment_type, loan.periods)
      else
        payments[i] = payment(loan.principal, loan.interest_rate, loan.payment_type, loan.periods)
      end
      interests[i] = ((balances[i-1]).to_f * (loan.interest_rate/payment_type_yearly_frecuency(loan.payment_type))).round(2)
      principals[i] = (payments[i] - interests[i]).round(2)
      if i == loan.periods
        balances[i] = (balances[i-1] - payments[i] + interests[i]).round(0)
      else
        balances[i] = (balances[i-1] - payments[i] + interests[i]).round(2)
      end
    end

    # Print amortization table
    puts "AMORTIZATION TABLE"
    puts "-"*65
    puts "Period\t Payment\t Principal\t Interest\t Balance"
    for i in(1..loan.periods)
      puts "#{i}\t #{payments[i]}\t #{principals[i]}\t #{interests[i]}\t #{balances[i]}"
    end
    line_feed
  end

end


# Auxiliar methods
def line_feed
  puts "\n"
end

# New empty loan
l = Loan.new(0,0,0,0)

line_feed
print 'Write the annual interest rate percentage (e.g. 25): '
l.interest_rate = gets.chomp.to_f/100

print 'Write the loan principal: '
l.principal = gets.chomp.to_f

print 'Write the loan periods: '
l.periods = gets.chomp.to_i

puts 'PAYMENT TYPE'
puts "\t 1) Monthly  2) Biweekly  3) Weekly"
print "\t Select a payment type: "
l.payment_type = gets.chomp.to_i
line_feed

puts "LOAN INFORMATION"
puts "-"*65
puts "Principal (loan amount): $#{l.principal}"
puts "Annual interest rate percentage: #{l.interest_rate*100}%"
puts "Total interest to pay: $#{((l.payment(l.principal, l.interest_rate, l.payment_type, l.periods) * l.periods) - l.principal).round(2)}"
puts "Total to pay: #{(l.payment(l.principal, l.interest_rate, l.payment_type, l.periods) * l.periods).round(2)}"
line_feed

puts "PAYMENTS PLAN"
puts "-"*65
puts "#{l.periods} #{l.payment_type_name(l.payment_type)} payments of $#{l.payment(l.principal, l.interest_rate, l.payment_type, l.periods)}"
line_feed

# Print amortization table and loan general info
l.amortization_table(l)
