require ::File.expand_path("../config/environment", __FILE__)

# Action Cable requires that all classes are loaded in advance
Rails.application.eager_load!

require "gotcha-bot"
GotchaBot::Factory.startup!

run Rails.application
