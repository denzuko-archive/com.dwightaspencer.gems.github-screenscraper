#!/usr/bin/env ruby
# Copyright (C)2010 Dwight Spencer <dspencer@denzuko.co.cc>
# All Rights Reserved
#
# github scraper
# Sample script to use hpricot xpath to screen scrap for a list of repositorys and thier description
#
# TODO: Change xpath to narrow down to the propper div and store results into an array
# TODO: Finish the app and convert to a gem

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'denzuko/github/screenscrapper'

content = Denzuko::Github::ScreenScrap.new "denzuko"
html   = content.search()
pp content.search().inner_html
