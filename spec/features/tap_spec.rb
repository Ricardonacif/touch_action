require 'spec_helper'

RSpec.describe TouchAction do
  describe "Tap" do
    it 'should tap the div binded by HammerJS' do
      @browser.goto('localhost:9292/tap')
      @browser.div(id: 'myElement').touch_action :tap
      expect(@browser.text).to include('tap')
    end

    it 'should tap link binded by FastClick' do
      @browser.goto('localhost:9292/tap')
      @browser.a(id: 'fastclick').touch_action :tap
      sleep(1)
      expect(@browser.p(id: 'fast-click-test').text).to include('1 times')
    end
  end
end
