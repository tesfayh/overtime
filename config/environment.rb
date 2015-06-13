# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

require 'pdf/writer'
Mime::Type.register 'application/pdf', :pdf
