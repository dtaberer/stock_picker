require 'spec_helper'
require_relative '../stock_picker'

describe StockPicker do
  describe '#stock_picker' do
    subject { StockPicker.new [17, 3, 6, 9, 15, 8, 6, 1, 10] }

    it "should return [1, 4] when we call the stock_picker method with [17, 3, 6, 9, 15, 8, 6, 1, 10]" do 
      result = subject.stock_picker
      expect(result).to eq [1, 4]
    end
  end

  describe '#stock_picker' do
    subject { StockPicker.new [6, 2, 1, 7] }

    it "should return [2, 3] when we call the stock_picker method with [6, 2, 1, 7]" do 
      result = subject.stock_picker
      expect(result).to eq [2, 3]
    end
  end
end
