require 'spec_helper'

RSpec.describe TouchAction do
  describe "Pinch" do
    it 'should pinch the photo bound by pinchzoom js' do
      @browser.goto('http://localhost:9292/pinch')
      pinch_zoom_div = @browser.div(class: 'pinch-zoom')
      last_transform_value = pinch_zoom_div.style('-webkit-transform')
      element = @browser.image
      element.touch_action :pinch
      sleep(5)
      expect(last_transform_value).not_to be_equal(pinch_zoom_div.style('-webkit-transform'))
    end
  end
end
