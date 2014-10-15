require 'spec_helper'

RSpec.describe TouchAction do
  describe "Pinch" do
    it 'should pinch the photo bound by pinchzoom js' do
      @browser.goto('http://localhost:9292/pinch')
      pinch_zoom_div = @browser.div(class: 'pinch-zoom')
      last_style = pinch_zoom_div.style
      element = @browser.image
      element.touch_action :pinch
      sleep(5)
      expect(last_style).not_to be_equal(pinch_zoom_div.style)
    end
  end
end
