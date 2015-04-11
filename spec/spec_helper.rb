require "rspec"
require "pry"
require 'rack'
require 'thin'
require 'touch_action'
require 'watir-webdriver'
require 'capybara'
require 'capybara/rspec'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}

@server_thread = Thread.new do
  Rack::Handler::Thin.run @app, :Port => 9292
end


case ENV['PLATFORM']
when 'ios'
  capabilities = {
    :deviceName => 'iPhone 5s',
    :browserName => 'Safari',
    :platformVersion => '8.2',
    :platformName => 'iOS',
    :app => 'safari',
    :newCommandTimeout => 9999
  }

when 'android'
  capabilities = {

  :deviceName => 'android_simulator',
  :version => '4.4.2',
  :platformName => 'Android',
  :newCommandTimeout => 9999,
  :browserName => 'Browser',
  :avd => 'android_simulator',
  autoAcceptAlerts: true
}

end


ENV['appium_url'] ||= "http://127.0.0.1:4723/wd/hub"
ENV['browser'] ||= 'firefox'

RSpec.configure do |config|

  config.before(:each) do |example|
    if ENV['PLATFORM']
      @browser = Watir::Browser.new(Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => ENV['appium_url']))
    else
      case example.metadata[:use_webdriver] 
      when :selenium
        @browser = Selenium::WebDriver.for :firefox
      when :capybara
        #do nothing
      else
        @browser = Watir::Browser.new ENV['browser']
      end
    end
  end
  config.after(:each) do
    @browser.close if @browser
  end
end