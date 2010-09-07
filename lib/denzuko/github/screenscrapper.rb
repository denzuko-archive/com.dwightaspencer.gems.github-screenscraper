$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'screenscrapper/libs'
require 'screenscrapper/class'
require 'screenscrapper/error'
