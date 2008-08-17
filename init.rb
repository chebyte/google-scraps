# Include hook code here
require 'scrubyt'
require 'google_scraps'
ActiveRecord::Base.send(:include, Feexus::GoogleScraps)