require 'spec_helper'

RSpec.describe TouchAction do
  describe "Flick" do
    it 'should flick the div bound by hammerJs' do
      @browser.goto('http://localhost:9292')
      div = @browser.div(id: 'hit')
      old_transform = div.style :transform
      div.touch_action :flick
      expect(div.style :transform).not_to include(old_transform)

      binding.pry
    end
  end
end
