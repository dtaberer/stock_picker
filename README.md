# stock_picker

Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

  > stock_picker([17,3,6,9,15,8,6,1,10])
  => [1,4]  # for a profit of $15 - $3 == $12
Quick Tips:

You need to buy before you can sell
Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.


$ rubocop stock_picker.rb


Inspecting 1 file
.

1 file inspected, no offenses detected

rspec -f d spec/

StockPicker
 
#stock_picker

Bought at $3 on day 1

Sold at $15 on day 4

Maximum profit is: $12

    should return [1, 4] when we call the stock_picker method with [17, 3, 6, 9, 15, 8, 6, 1, 10]

 #stock_picker

Bought at $1 on day 2

Sold at $7 on day 3

Maximum profit is: $6

    should return [2, 3] when we call the stock_picker method with [6, 2, 1, 7]


Finished in 0.00149 seconds (files took 0.09632 seconds to load)

2 examples, 0 failures
