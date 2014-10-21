require 'spec_helper'

RSpec.describe TouchAction do
  describe "Move" do
    it 'should move the div bound by hammerJs' do
      @browser.goto('http://localhost:9292')
      div = @browser.div(id: 'hit')
      div.touch_action :move
      sleep(5)
      expect(@browser.p(id: 'distance_x').text).to include('70')
      expect(@browser.p(id: 'distance_y').text).to include('-50')
    end

  end
end
