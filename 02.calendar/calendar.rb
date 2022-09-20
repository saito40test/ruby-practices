#!/usr/bin/env ruby

require 'date'
require 'optparse'
opt = OptionParser.new

# 引数チェック
params = {}

opt.on('-m [Month]') {|v| v }
opt.on('-y [Year]') {|v| v }

opt.parse!(ARGV, into: params) # intoオプションにハッシュを渡す

# 年月日作成
# day = Date.today.day
month = Date.today.mon
year = Date.today.year
month = params[:m].to_i if params[:m]
year = params[:y].to_i if params[:y]

# カレンダー作成
cur_end_day = Date.new(year, month, -1).day

calender = ""
calender += " #{month}月 #{year}        \n\r"
calender += "日 月 火 水 木 金 土  \n\r"

first_week_day = Date.new(year, month, 1).wday
(1..first_week_day).each{ calender += "   " }

(1..cur_end_day).each do |day|
  calender += "#{day}".rjust(3)
  calender += "\n\r" if Date.new(year, month, day).saturday?
end

puts calender
