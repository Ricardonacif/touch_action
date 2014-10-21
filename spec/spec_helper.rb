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

ios_capabilities = {
  :deviceName => 'iPhone 5s',
  :browserName => 'Safari',
  :platformVersion => '7.1',
  :platformName => 'iOS',
  :app => 'safari',
  :newCommandTimeout => 9999
}

android_capabilities = {

  :deviceName => 'android_simulator',
  :version => '4.4.2',
  :platformName => 'Android',
  :newCommandTimeout => 9999,
  :browserName => 'Browser',
  :avd => 'android_simulator',
  autoAcceptAlerts: true
}

server_url = "http://127.0.0.1:4723/wd/hub"

RSpec.configure do |config|

  config.before(:each) do
    # @browser = Watir::Browser.new :chrome
    @browser = Watir::Browser.new(Selenium::WebDriver.for(:remote, :desired_capabilities => ios_capabilities, :url => server_url))
  end
  config.after(:each) do
    @browser.close if @browser
  end
end