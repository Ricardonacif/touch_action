require 'spec_helper'

RSpec.describe TouchAction do
  describe "Press" do
    it 'should press the div bound by HammerJS' do
      @browser.goto('http://localhost:9292/tap')
      element = @browser.div(id: 'myElement')
      element.touch_action :press
      sleep(5)
      expect(element.text).to include('press')
    end
  end
end
