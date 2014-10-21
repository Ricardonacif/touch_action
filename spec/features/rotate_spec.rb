require 'spec_helper'

RSpec.describe TouchAction do
  describe "Rotate" do
    it 'should Rotate the photo bound by pinchzoom js' do
      @browser.goto('http://localhost:9292')
      div = @browser.div(id: 'hit')
      div.touch_action :move # don't ask me why, on this example rotate only works after a move
      sleep(5)
      last_transform_value = div.style('-webkit-transform')
      div.touch_action :rotate
      sleep(3)
      expect(last_transform_value).not_to be_equal(div.style('-webkit-transform'))
    end
  end
end
