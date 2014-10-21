require 'spec_helper'

RSpec.describe TouchAction do
  describe "Flick" do
    it 'should flick the div bound by hammerJs' do
      @browser.goto('http://localhost:9292')
      div = @browser.div(id: 'hit')
      div.touch_action :flick
      sleep(5)
      expect(@browser.p(id: 'distance_x').text).to include('100')
    end

    it 'should flick the div bound by hammerJs when passing swipe instead of flick' do
      @browser.goto('http://localhost:9292')
      div = @browser.div(id: 'hit')
      div.touch_action :swipe
      sleep(5)
      expect(@browser.p(id: 'distance_x').text).to include('100')
    end

    context "Options" do

      it 'should flick the div bound by hammerJs to the left when passing the a negative distance' do
        @browser.goto('http://localhost:9292')
        div = @browser.div(id: 'hit')
        div.touch_action :flick, distance: -80
        sleep(5)
        expect(@browser.p(id: 'distance_x').text).to include('-80')
      end
    end
  end
end
