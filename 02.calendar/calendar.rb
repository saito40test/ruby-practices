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
day = Date.today.day
month = Date.today.mon
year = Date.today.year
month = params[:m].to_i if params[:m]
year = params[:y].to_i if params[:y]

# cur_date = Date.new(year, month, day)
# p cur_date

# カレンダー作成
cur_end_day = Date.new(year, month, -1).day

calender = ""
calender += " #{month}月 #{year}        \n\r"
calender += "日 月 火 水 木 金 土  \n\r"
#                 1  2  
#  3  4  5  6  7  8  9  
# 10 11 12 13 14 15 16  
# 17 18 19 20 21 22 23  
# 24 25 26 27 28 29 30
first_week_day = Date.new(year, month, 1).wday
(1..first_week_day).each do |_|
    calender += "   "
end

(1..cur_end_day).each do |day|
    calender += " "
    calender += " " if day < 10

    if day == Date.today.day
        print "\e[31m"
        calender += "#{day}"
        print "\e[0m"
    else
        calender += "#{day}"
    end
    
    calender += "\n\r" if Date.new(year, month, day).wday == 6
end

puts calender
