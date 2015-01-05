require 'spec_helper'

RSpec.describe TouchAction do
  describe "Tap", type: :feature do
    it 'should tap the div bound by HammerJS' do
      @browser.goto('http://localhost:9292/tap')
      element = @browser.div(id: 'myElement')
      element.touch_action :tap
      sleep(5)
      expect(element.text).to include('tap')
    end

    it 'should tap link bound by FastClick' do
      @browser.goto('http://localhost:9292/tap')
      @browser.a(id: 'fastclick').touch_action :tap
      sleep(5)
      expect(@browser.p(id: 'fast-click-test').text).to include('1 times')
    end

    it "should tap using webdriver capybara", js: true, use_webdriver: :capybara do
      visit('http://localhost:9292/tap')
      touch_action '#myElement', :tap
      sleep(5)
      expect(find("#myElement").text).to include('tap')
    end

  end
end