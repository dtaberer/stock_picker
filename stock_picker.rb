# frozen_string_literal: true

# ODIN project
class StockPicker
  ARGUMENT_ERROR_MSG = 'Please provide a list containing more than 1 days of prices!'

  def initialize(day_prices)
    self.day_prices = day_prices
  rescue ArgumentError => e
    raise ArgumentError, e
  end

  def stock_picker(day_prices = nil)
    self.day_prices = day_prices if day_prices
    result = maximum_profit
    puts "Bought at $#{bought_price result} on day #{bought_day result}"
    puts "Sold at $#{sold_price result} on day #{sold_day result}"
    puts "Maximum profit is: $#{profit_value result}"
    days_array result
  rescue ArgumentError => e
    raise ArgumentError, e
  end

  private

  def day_prices=(prices = nil)
    @day_prices ||= prices
    raise ArgumentError, ARGUMENT_ERROR_MSG if prices.count < 2
  end

  def days_array(result)
    result[1]
  end

  def bought_price(result)
    @day_prices[result[1][0]]
  end

  def bought_day(result)
    days_array(result)[0]
  end

  def sold_day(result)
    days_array(result)[1]
  end

  def sold_price(result)
    @day_prices[result[1][1]]
  end

  def profit_value(result)
    result[0]
  end

  # This function works on the top level, accessing only
  # the maximum profits for each day, then extracts the final
  # result from this list.
  def maximum_profit
    maximum_profits = []
    @day_prices.each_with_index do |buy, day|
      maximum_profits << maximum_profit_by_day(day, buy)
    end
    sanitize maximum_profits
  end

  # Builds out a list of days and profits in the following form:
  # [[3, [1,2], [6, [1,3]], ...]
  # The first element is the profit and the second are the day indices.
  # This makes it easy to max by profit, leveraging the built-in
  # ruby methods to manage data structures as opposed to using
  # local variables for condition testing.  Less prone to error
  # and makes it very easy to debug and test.
  def maximum_profit_by_day(day, buy)
    profits = []
    @day_prices[day + 1..].each_with_index.map do |sell, index|
      profits << [sell - buy, [day, index + day + 1]]
    end
    sanitize profits
  end

  def sanitize(day_profits)
    day_profits.compact.reject(&:empty?).max_by { |p| p[0] }
  end
end
