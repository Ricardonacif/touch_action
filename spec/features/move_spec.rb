require 'spec_helper'

RSpec.describe TouchAction do
  describe "Move" do
    it 'should move the div bound by hammerJs' do
      binding.pry
      @browser.goto('http://localhost:9292')
      div = @browser.div(id: 'blue')
      div.touch_action :flick
      sleep(5)
      expect(@browser.p(id: 'direction').text).to include('swiped right')
    end

  end
end
