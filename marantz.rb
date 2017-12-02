#!/usr/bin/env ruby


require 'marantz'
require 'optparse'

options = {}
OptionParser.new do |opts|
	opts.banner = "Usage: m.rb [options]"

	opts.on("-v", "--volume VOL", "volume") do |v|
		options[:volume] = v
	end
	opts.on("-a", "--off", "AUS") do |a|
		options[:off] = a
	end
	opts.on("-o", "--on", "ON") do |o|
		options[:on] = o
	end
	opts.on("-s", "--source SRC", "SOURCE") do |s|
		options[:source] = s
	end
end.parse!

puts options


Marantz.configure do |config|
	config.host = '10.10.0.202'
	config.max_volume = 99.0
end

avr = Marantz::Client.new

if options[:off]
	avr.off
end
if options[:on]
	avr.on
end

avr.volume = options[:volume]

if options[:source]
	avr.source = options[:source]
end

puts avr.source
