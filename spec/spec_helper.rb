require "rspec"
require "pry"
require 'rack'
require 'thin'
require 'touch_action'
require 'watir-webdriver'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}

@server_thread = Thread.new do
  Rack::Handler::Thin.run @app, :Port => 9292
end

RSpec.configure do |config|

  config.before(:each) do
    @browser = Watir::Browser.new :chrome
  end
  config.after(:each) do
    @browser.close
  end
end