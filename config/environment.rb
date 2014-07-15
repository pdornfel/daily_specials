# Load the Rails application.
require File.expand_path('../application', __FILE__)

TWILIO_CONFIG = YAML.load_file("#{Rails.root}/config/twilio.yml")[Rails.env].symbolize_keys

# Initialize the Rails application.
Rails.application.initialize!
