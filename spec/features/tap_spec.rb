require 'spec_helper'

RSpec.describe TouchAction do
  describe "Tap" do
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
  end
end
